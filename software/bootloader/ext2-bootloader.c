// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#include <stdint.h>
#include <string.h>


#define kRedLEDAddr ((char*)0xF0000000)
#define kGreenLEDAddr ((char*)0xF0000010)
#define kSDCardAddr ((char*)0xE8004000)

#define blockAddr(x) (baseAddr + blockSize*(x))


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

struct inode
{
    uint16_t type;
    uint16_t userID;
    uint32_t sizel;
    int32_t  t_accessed;
    int32_t  t_creation;
    int32_t  t_modified;
    int32_t  t_deletion;
    uint16_t groupID;
    uint16_t n_link;
    uint32_t n_sector;
    uint32_t flags;
    uint32_t os_value;
    uint32_t direct[12];
    uint32_t indirect_one;
    uint32_t indirect_two;
    uint32_t indirect_three;
    uint32_t n_generation;
    uint32_t acl;
    uint32_t sizeh;
    uint32_t frag_addr;
    uint8_t  os_value_2[12];
};

struct directory
{
    uint32_t inode;
    uint16_t dir_len;
    uint8_t name_len;
    uint8_t type;
    char name[0];
};

struct inodeIteratorContext
{
    uint32_t pos;
    uint32_t numLeft;
    uint32_t totalCount;
    uint32_t data[128]; // 1024 % (length of data array) MUST == 0
};

// ELF file details
#define EI_NIDENT 16
struct elf_header 
{ 
    uint8_t indent[EI_NIDENT];
    uint16_t type;
    uint16_t machine;
    uint32_t version;
    uint32_t entry;
    uint32_t phoff;
    uint32_t shoff;
    uint32_t flags;
    uint16_t ehsize;
    uint16_t phentsize;
    uint16_t phnum;
    uint16_t shentsize;
    uint16_t shnum;
    uint16_t shstrndx;
}; 

struct elf_section
{
    uint32_t name;
    uint32_t type;
    uint32_t flags;
    uint32_t addr;
    uint32_t offset;
    uint32_t size;
    uint32_t link;
    uint32_t info;
    uint32_t addralign;
    uint32_t entsize;
};


struct superblock spb;
struct extended_superblock espb;
void* baseAddr;
uint32_t inode_size;
uint32_t blockSize;

//indicate failure to the user
void fail(uint8_t code)
{
    __builtin_stwio(kGreenLEDAddr, code << 4);                //light only the upper 4 LEDs
    while(1);
}

//no cache memcpy
void no_cache_cpy(void* dest, void* source, size_t len)
{
    uint8_t* dst1 = dest;
    uint8_t* src = source;
    uint8_t amount = (uint32_t)src % 4;
    len -= amount;
    switch (amount)
    {
        case 1: *dst1++ = __builtin_ldbio(src++); len--;
        case 2: *dst1++ = __builtin_ldbio(src++); len--;
        case 3: *dst1++ = __builtin_ldbio(src++); len--;
    }
    uint32_t* dst = (uint32_t*)dst1;
    while(len >= 4)
    {
        *dst++ = __builtin_ldwio(src);
        src += sizeof(void*);
        len -= sizeof(void*);
    }
    dst1 = (uint8_t*)dst;
    switch (len)
    {
        case 3: *dst1++ = __builtin_ldbio(src++);
        case 2: *dst1++ = __builtin_ldbio(src++);
        case 1: *dst1++ = __builtin_ldbio(src++);
    }
}

void readSector(unsigned int block)
{
    do
    {
        __builtin_stwio(kSDCardAddr + 556, block * 512);    //change the block address into an offset
        __builtin_stwio(kSDCardAddr + 560, 0x11);           //0x11 is SD card opcode for read

        while(__builtin_ldwio(kSDCardAddr + 564) & 4);      //wait for the operation to complete
    } while(__builtin_ldwio(kSDCardAddr + 564) & 0x10);     //restart it if it faileh

}

void readAddr(const void* addr, void* output, size_t len)
{
    while(len)
    {
        uint32_t offset = ((uint32_t)addr & 0x1FF);
        uint32_t amountLeft = 512 - offset;
        uint32_t tocopy = amountLeft > len ? len : amountLeft;
        readSector((uint32_t)addr >> 9);
        no_cache_cpy(output, kSDCardAddr + offset, tocopy);
        output += tocopy;
        addr += tocopy;
        len -= tocopy;
    }
}


uint32_t unsign_div_ceil(uint32_t dividend, uint32_t divisor)
{
    return dividend/divisor + !!(dividend % divisor);
}

//return the number of blocks copied int the buffer
uint32_t blocksAtInodeIndex(const struct inode* inode, uint32_t index, uint32_t* buf, uint32_t buflen)
{
    //total number of blocks
    uint64_t filesize = (uint64_t)inode->sizeh << 32 | inode->sizel;

    //num blocks = ceil(filesize/blockSize)
    uint32_t numBlocks = filesize/blockSize + !!(filesize % blockSize);
    buflen = (buflen + index) > numBlocks ? numBlocks - index : buflen;

    uint32_t blocksPerBlock = blockSize/sizeof(uint32_t);

    uint32_t toCopy;
    uint32_t left;
    
    //direct blocks
    if(index < 12)
    {
        left = 12 - index;
        toCopy = left > buflen ? buflen : left;
        memcpy(buf, inode->direct + index, sizeof(uint32_t)*toCopy);
    }

    //single indirection
    else if(index -= 12, left = blocksPerBlock - index, toCopy = left > buflen ? buflen : left, index < blocksPerBlock)
    {
        uint32_t* addr = blockAddr(inode->indirect_one) + index*sizeof(uint32_t);
        readAddr(addr, buf, sizeof(uint32_t)*toCopy);
    }
    
    //double indirection
    else if(index -= blocksPerBlock, index < blocksPerBlock*blocksPerBlock)
    {
        uint32_t* addr = (uint32_t*)blockAddr(inode->indirect_two);
        addr += index/blocksPerBlock;
        uint32_t newBlock;
        readAddr(addr, &newBlock, sizeof(uint32_t));
        addr = (uint32_t*)blockAddr(newBlock) + (index % blocksPerBlock)*sizeof(uint32_t);
        readAddr(addr, buf, sizeof(uint32_t*)*toCopy);
    }

    //triply indirect
    else if(index -= blocksPerBlock*blocksPerBlock, index < blocksPerBlock*blocksPerBlock*blocksPerBlock)
    {
        uint32_t* addr = (uint32_t*)blockAddr(inode->indirect_three);
        addr += index/blocksPerBlock*blocksPerBlock;
        uint32_t nextBlock;
        readAddr(addr, &nextBlock, sizeof(uint32_t));
        addr = (uint32_t*)blockAddr(nextBlock);
        addr += index/blocksPerBlock;
        readAddr(addr, &nextBlock, sizeof(uint32_t));
        addr = (uint32_t*)blockAddr(nextBlock) + (index % blocksPerBlock)*sizeof(uint32_t);
        readAddr(addr, buf, sizeof(uint32_t*)*toCopy);
    }

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
    uint32_t len = blockSize;
    uint32_t count = 0;
    while(len)
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
        len -= dir.dir_len;
        count++;
    }

    return 0;
}

//finds the address of an inode
void readInode(uint32_t inode, struct inode* toRead)
{
    char* blk_grp = blockAddr(spb.i_super + 1) + sizeof(struct block_group_descriptor)*((inode - 1)/spb.n_inode_per_group);
    struct block_group_descriptor blk_grp_descrip;

    readAddr(blk_grp, &blk_grp_descrip, sizeof(blk_grp_descrip));

    //load the root inode table
    char* addr = blockAddr(blk_grp_descrip.a_inode_table) + inode_size*((inode - 1) % spb.n_inode_per_group);
    readAddr(addr, toRead, sizeof(*toRead));
}


void readFileOffset(const struct inode* file, void* dest, size_t len, size_t offset)
{
    char* dst = dest;
    while(len)
    {
        uint32_t left = blockSize - (offset % blockSize);
        uint32_t toCopy = left > len ? len : left;
        uint32_t block;
        blocksAtInodeIndex(file, offset/blockSize, &block, 1);
        char* addr = blockAddr(block) + (offset % blockSize);
        readAddr(addr, dst, toCopy);
        len -= toCopy;
        dst += toCopy;
        offset += toCopy;
    }
}

int main()
{
    __builtin_stwio(kGreenLEDAddr, 0x8);                    //indicate waiting for SD card
    while(!(__builtin_ldwio(kSDCardAddr + 564) & 0x2));     //wait for SD card
    
    __builtin_stwio(kGreenLEDAddr, 0x4);                    //indicate SD Card detected

    readSector(1);                                           //read the GPT header block
    readSector(__builtin_ldwio(kSDCardAddr + 72));           //GPT - byte 72 is the starting LBA of the partition list
    baseAddr = (void*)(__builtin_ldwio(kSDCardAddr + 32) * 512);
    
    readAddr(baseAddr + 1024, &spb, sizeof(spb));           //ext2 superblock is always 1024 bytes from the start of the partition
    blockSize = 1024 << spb.s_block;

    //check for ext2 magic code and that the filesystem is currently clean
    if(spb.e_signature != 0xEF53 || spb.e_state != 1)
    {
        fail(1);
    }

    //another consistency check
    uint32_t n_block_group = unsign_div_ceil(spb.n_block, spb.n_block_per_group);
    if(n_block_group != unsign_div_ceil(spb.n_inode, spb.n_inode_per_group))
    {
        fail(2);
    }
    
    //load the extended attributes if nesescary
    if(spb.v_major >= 1)
    {
        readAddr(baseAddr + 1024 + sizeof(spb), &espb, sizeof(espb));
        inode_size = espb.s_inode;
    }
    else
    {
        inode_size = 128;
    }

    //load the root inode (defined to be inode 2)
    struct inode root;
    readInode(2, &root);

    //locate the kernel file
    uint32_t kernel_inode = 0;
    struct inodeIteratorContext rootIt;
    memset(&rootIt, 0, sizeof(rootIt));
    uint32_t nextBlock = 0;
    while((iterateNode(&root, &rootIt, &nextBlock) == 0) && !kernel_inode)
    {
        if(nextBlock)
        {
            kernel_inode = scanBlock(nextBlock, "kernel");
        }
    }
    if(!kernel_inode)
    {
        fail(3);
    }
    __builtin_stwio(kGreenLEDAddr, 0x2);                //indicate start of copying

    //read in the kernel's inode
    struct inode kernel;
    readInode(kernel_inode, &kernel);
   
    //then read in the ELF header
    struct elf_header hdr;
    readFileOffset(&kernel, &hdr, sizeof(hdr), 0);

    //check for ELF file signature and little endian encoding
    if(*((uint32_t*)hdr.indent) != 0x464c457f || hdr.indent[5] != 1)
    {
        fail(4);
    }   

    char* addr = (char*)hdr.shoff;

    //check each ELF section and copy it in if the ALLOC flag is set
    for(uint32_t i = 0; i < hdr.shnum; i++)
    {
        struct elf_section sect;
        readFileOffset(&kernel, &sect, sizeof(sect), (size_t)addr);

        if(sect.flags & 0x2)
        {
            if(sect.type == 8)
            {
                //it's a section that just needs to be set to 0
                memset((char*)sect.addr, 0, sect.size);
            }
            else
            {
                 //copy the bytes into memory
                readFileOffset(&kernel, (char*)sect.addr, sect.size, sect.offset); 
            }
        }

        addr += hdr.shentsize;
    }
    
    __builtin_stwio(kGreenLEDAddr, 0x1);                //indicate done copying    


    
    __asm__ ("mov r6, %0\n"                             //load the jump target from the ELF into r6
            "mov r4, r0\n"
            "ori r5, r0, 4096\n"                        //flush the data cache
            "dcache_init_loop:\n"
            "flushda 0(r4)\n"
            "addi r4, r4, 32\n"
            "bltu r4, r5, dcache_init_loop\n"           //clear the instruction cache
            "mov r4, r0\n"
            "ori r5, r0, 4096\n"
            "icache_init_loop:\n"
            "initi r4\n"
            "addi r4, r4, 4\n"
            "bltu r4, r5, icache_init_loop\n"
            "flushp\n"                                  //flush the pipeline and jump
            "jmp r6\n"
            : :"r" (hdr.entry) : "r4", "r5", "r6");

}
