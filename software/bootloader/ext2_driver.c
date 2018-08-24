// Written by:
//     Evan Andersen
//
// Created March 22, 2013


#include "ext2_driver.h"

#define blockAddr(x) ((void*)(blockSize*(x)))


struct superblock
{
    uint32_t n_inode;
    uint32_t n_block;
    uint32_t n_resv_block;
    uint32_t n_free_block;
    uint32_t n_free_inode;
    uint32_t i_super;
    uint32_t s_block;
    uint32_t s_frag;
    uint32_t n_block_per_group;
    uint32_t n_frag_per_group;
    uint32_t n_inode_per_group;
    int32_t t_last_mount;
    int32_t t_last_modified;
    uint16_t n_mounted;
    uint16_t n_max_mount;
    uint16_t e_signature;
    uint16_t e_state;    
    uint16_t e_error_mode;
    uint16_t v_minor;
    int32_t t_last_check;
    int32_t t_max_check_period;
    uint32_t e_os_id;
    uint32_t v_major;
    uint16_t e_user_id;
    uint16_t e_group_id;
};

struct extended_superblock
{
    uint32_t i_non_resv_inode;
    uint16_t s_inode;
    uint16_t i_block_grp;
    uint32_t f_optional_feature;
    uint32_t f_required_feature;
    uint32_t f_readonly_feature;
    uint8_t  id[16];
    char name[16];
    char lastMounted[64];
    uint32_t f_compression_algo;
    uint8_t n_prealloc_file;
    uint8_t n_prealloc_dir;
    uint16_t padding;
    uint8_t journal_id[16];
    uint32_t journal_inode;
    uint32_t journal_device;
    uint32_t orphan_inode_list;
};

struct block_group_descriptor
{
    uint32_t a_block_usage;
    uint32_t a_inode_usage;
    uint32_t a_inode_table;
    uint16_t n_free_block;
    uint16_t n_free_inode;
    uint16_t n_dir;
    char padding[14];
};

struct directory
{
    uint32_t inode;
    uint16_t dir_len;
    uint8_t name_len;
    uint8_t type;
    char name[0];
};

struct inodeIteratorContext {
    uint32_t pos;
    uint32_t numLeft;
    uint32_t totalCount;
    uint32_t data[128]; // 1024 % (length of data array) MUST == 0
};


struct superblock spb;
struct extended_superblock espb;
void* baseAddr = 0;
uint32_t inode_size;
uint32_t blockSize;


int readSector(unsigned int block) {
    
    __builtin_stwio(SDCARD + 556, block * 512);    //change the block address into an offset
    __builtin_sthio(SDCARD + 560, 0x11);           //0x11 is SD card opcode for read
    uint32_t status = 0x4;
    while(status & 0x4) {
        status = __builtin_ldhio(SDCARD + 564);
    }
    return status;
}

void readAddr(void* addr, void* output, size_t len) {
    //translate address from filesystem space to disk space
    addr = (void*)((uint32_t)addr + (uint32_t)baseAddr);
    while(len)
    {
        uint32_t offset = ((uint32_t)addr & 0x1FF);
        uint32_t amountLeft = 512 - offset;
        uint32_t tocopy = amountLeft > len ? len : amountLeft;
        readSector((uint32_t)addr >> 9);
        no_cache_cpy(output, SDCARD + offset, tocopy);
        output += tocopy;
        addr += tocopy;
        len -= tocopy;
    }
}


uint32_t unsign_div_ceil(uint32_t dividend, uint32_t divisor) {
    return dividend/divisor + !!(dividend % divisor);
}

//return the number of blocks copied into the buffer
uint32_t blocksAtInodeIndex(const struct inode* inode, uint32_t index, uint32_t* buf, uint32_t buflen) {
    //total number of blocks
    uint64_t filesize = (uint64_t)inode->sizeh << 32 | inode->sizel;

    //num blocks = ceil(filesize/blockSize)
    uint32_t numBlocks = filesize/blockSize + !!(filesize % blockSize);
    buflen = (buflen + index) > numBlocks ? numBlocks - index : buflen;

    uint32_t blocksPerBlock = blockSize/sizeof(uint32_t);

    uint32_t toCopy;
    uint32_t left;
    
    //direct blocks
    if(index < 12) {
        left = 12 - index;
        toCopy = left > buflen ? buflen : left;
        memcpy(buf, inode->direct + index, sizeof(uint32_t)*toCopy);
        return toCopy;
    }

    index -= 12;
    left = blocksPerBlock - index;
    toCopy = left > buflen ? buflen : left;

    //single indirection
    if(index < blocksPerBlock) {
        uint32_t* addr = blockAddr(inode->indirect_one) + index*sizeof(uint32_t);
        readAddr(addr, buf, sizeof(uint32_t)*toCopy);
        return toCopy;
    }
    index -= blocksPerBlock;

    //double indirection
    if(index < blocksPerBlock*blocksPerBlock) {
        uint32_t* addr = (uint32_t*)blockAddr(inode->indirect_two);
        addr += index/blocksPerBlock;
        uint32_t newBlock;
        readAddr(addr, &newBlock, sizeof(uint32_t));
        addr = (uint32_t*)blockAddr(newBlock) + (index % blocksPerBlock)*sizeof(uint32_t);
        left = blocksPerBlock - (index % blocksPerBlock);
        toCopy = left > buflen ? buflen : left;
        readAddr(addr, buf, sizeof(uint32_t*)*toCopy);
        return toCopy;
    }
    index -= blocksPerBlock*blocksPerBlock;

    //triply indirect
    uint32_t* addr = (uint32_t*)blockAddr(inode->indirect_three);
    addr += index/blocksPerBlock*blocksPerBlock;
    uint32_t nextBlock;
    readAddr(addr, &nextBlock, sizeof(uint32_t));
    addr = (uint32_t*)blockAddr(nextBlock);
    addr += index/blocksPerBlock;
    readAddr(addr, &nextBlock, sizeof(uint32_t));
    addr = (uint32_t*)blockAddr(nextBlock) + (index % blocksPerBlock)*sizeof(uint32_t);
    readAddr(addr, buf, sizeof(uint32_t*)*toCopy);

    return toCopy;
}

int iterateNode(const struct inode* inode, struct inodeIteratorContext* ctx, uint32_t* next)
{
    if(!ctx->numLeft)
    {
        ctx->numLeft = blocksAtInodeIndex(inode, ctx->totalCount, ctx->data, sizeof(ctx->data)/sizeof(ctx->data[0]));
        if(ctx->numLeft == 0)
        {
            return -1;
        }
    }

    //read the next block
    ctx->numLeft--;
    ctx->totalCount++;
    *next = ctx->data[ctx->pos++];

    return 0;    
}

uint32_t scanBlock(uint32_t block_num, const char* filename)
{
    char* addr = blockAddr(block_num);
    uint32_t remain = blockSize;
    uint32_t count = 0;
    while(remain)
    {
        struct directory dir;
        readAddr(addr, &dir, sizeof(dir));
        
        char name[256];
        readAddr(addr + sizeof(struct directory), name, dir.name_len);
        name[dir.name_len] = 0;
        if(!strcmp(name, filename))
        {
            return dir.inode;
        }
        addr += dir.dir_len;
        remain -= dir.dir_len;
        count++;
    }

    return 0;
}

//finds the address of an inode
void readInode(uint32_t inode, struct inode *toRead) {
    char* blk_grp = blockAddr(spb.i_super + 1) + sizeof(struct block_group_descriptor)*((inode - 1)/spb.n_inode_per_group);
    struct block_group_descriptor blk_grp_descrip;

    readAddr(blk_grp, &blk_grp_descrip, sizeof(blk_grp_descrip));

    //load the root inode table
    char* addr = blockAddr(blk_grp_descrip.a_inode_table) + inode_size*((inode - 1) % spb.n_inode_per_group);
    readAddr(addr, toRead, sizeof(*toRead));
}

// int nextFileBlock(struct fileDescriptor *desc, uint32_t *block) {
//     if(desc->bLeft == 0) {
//         desc->bLeft = blocksAtInodeIndex(&desc->i, desc->pos/blockSize, &desc->b, sizeof(desc->b)/sizeof(desc->b[0]));
//         desc->bPos = 0;
//     }

//     desc->bLeft--;
//     *block = desc->b[desc->bPos];
//     desc->bPos++;
//     return 0;
// }

//reads an entire file into memory
//buffer has to be at least as large as the file
int ext2_readall(struct inode *inode, void *buf) {
    size_t len = inode->sizel;
    size_t pos = 0;
    char* dst = buf;
    while(len > 0)
    {
        uint32_t toCopy = blockSize > len ? len : blockSize;
        uint32_t block;
        blocksAtInodeIndex(inode, pos/blockSize, &block, 1);
        char* addr = blockAddr(block);
        readAddr(addr, dst, toCopy);
        len -= toCopy;
        dst += toCopy;
        pos += toCopy;
    }
    return 0;
}

//find a file in the root directory, if it exists, populate inode struct
int ext2_findRootFile(char *name, struct inode *inode) {
    //load the root inode (defined to be inode 2)
    struct inode root;
    readInode(2, &root);

    //locate the file
    uint32_t file_inode = 0;
    struct inodeIteratorContext rootIt;
    memset(&rootIt, 0, sizeof(rootIt));
    uint32_t nextBlock = 0;
    while((iterateNode(&root, &rootIt, &nextBlock) == 0) && !file_inode)
    {
        if(nextBlock)
        {
            file_inode = scanBlock(nextBlock, name);
        }
    }
    if(!file_inode)
    {
        return -1;
    }

    readInode(file_inode, inode);
    return 0;
}

int ext2_init() {
    uint16_t status = __builtin_ldhio(SDCARD + 564);
    if(!(status & 0x2)) {
        //no card detected
        return -1;
    }

    //read the GPT header block
    readSector(1);
    //GPT header - bytes 72-80 store starting LBA of the partition list
    //it's little endian so assume starting LBA <4 billion and this works
    uint32_t startLBA = __builtin_ldwio(SDCARD + 72);                    
    readSector(startLBA);           

    //assume the first partition is the one we want
    // bytes 32-40 store starting LBA for the partition
    //again assume <4 billion
    baseAddr = (void*)(__builtin_ldwio(SDCARD + 32) * 512);

    //ext2 superblock is always 1024 bytes from the start of the partition
    readAddr((void*)1024, &spb, sizeof(spb));

    //check for the magic ext2 code
    if(spb.e_signature != 0xEF53) {
        return -2;
    }
    // //ensure filesystem is marked as clean
    // if(spb.e_state != 1) {
    //     return -3;
    // }
    //another consistency check
    uint32_t n_block_group = unsign_div_ceil(spb.n_block, spb.n_block_per_group);
    if(n_block_group != unsign_div_ceil(spb.n_inode, spb.n_inode_per_group))
    {
        return -4;
    }

    //load the extended attributes if nesescary
    if(spb.v_major >= 1)
    {
        readAddr((void*)(1024 + sizeof(spb)), &espb, sizeof(espb));
        inode_size = espb.s_inode;
    }
    else
    {
        inode_size = 128;
    }
    blockSize = 1024 << spb.s_block;

    return 0;
}
