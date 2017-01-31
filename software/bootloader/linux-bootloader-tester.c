#define _XOPEN_SOURCE 500

#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>


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
};

struct superblock spb;
struct extended_superblock espb;
char* baseAddr = 0;
int in = 0;
uint16_t inode_size = 128;

void readAddr(void* addr, void* output, size_t len)
{
    printf("Reading %zd bytes from %lu\n", len, addr);
    ssize_t result = pread(in, output, len, (off_t)addr);
    if(result == -1)
    {
        perror("Failed to read data");
        close(in);
        exit(-1);
    }
}

void readInode(uint32_t inode, struct inode* toRead)
{
    printf("baseAddr is %lu\n", baseAddr);
    char* blk_grp = baseAddr + (1024 << spb.s_block)*(spb.i_super + 1) + sizeof(struct block_group_descriptor)*((inode - 1)/spb.n_inode_per_group);
    struct block_group_descriptor blk_grp_descrip;

    printf("inode %u's block group is at %llu\n", inode, (uint64_t)((char*)blk_grp - baseAddr));
    readAddr(blk_grp, &blk_grp_descrip, sizeof(blk_grp_descrip));
    

    printf("a_block_usage: %u\n", blk_grp_descrip.a_block_usage);
    printf("a_inode_usage: %u\n", blk_grp_descrip.a_inode_usage);
    printf("a_inode_table: %u\n", blk_grp_descrip.a_inode_table);
    printf("n_free_block: %hu\n", blk_grp_descrip.n_free_block);
    printf("n_free_inode: %hu\n", blk_grp_descrip.n_free_inode);
    printf("n_dir: %hu\n", blk_grp_descrip.n_dir);

    //load the root inode table
    char* addr = baseAddr + (1024 << spb.s_block)*blk_grp_descrip.a_inode_table + inode_size*((inode - 1) % spb.n_inode_per_group);
    readAddr(addr, toRead, sizeof(*toRead));
}


void printHex(const void* buf, size_t len)
{
    const char* in = buf;
    for(size_t i = 0; i < len; i++)
    {
        printf("%hhx ", in[i]);
    }
    printf("\n");
}

int main(int argc, char** argv)
{
    if(argc != 2)
    {
        fprintf(stderr, "Usage is %s <filepath>\n", argv[0]);
        return -1;
    }
    in = open(argv[1], O_RDONLY);
    if(in == -1)
    {
        perror("Failed to open input file");
        return -1;
    }

    //read the GPT header
    char buf[512];
    ssize_t result = pread(in, buf, sizeof(buf), 512);
    if(result == -1)
    {
        perror("Failed to read GPT header");
        close(in);
        return -1;
    }

    uint64_t offset = *(uint64_t*)(buf + 72);
    result = pread(in, buf, sizeof(buf), offset*512);
    if(result == -1)
    {
        perror("Failed to read GPT partition data");
        close(in);
        return -1;
    }
    
    
    baseAddr = (void*)(*(uint64_t*)(buf + 32) * 512);


    result = pread(in, &spb, sizeof(spb), (off_t)baseAddr + 1024);
    if(result == -1)
    {
        perror("Failed to read ext2 superblock");
        close(in);
        return -1;
    }
    if(spb.v_major >= 1)
    {
        result = pread(in, &espb, sizeof(espb), (off_t)baseAddr + 1024 + sizeof(spb));
        if(result == -1)
        {
            perror("Failed to read ext2 extended superblock");
            close(in);
            return -1;
        }
        inode_size = espb.s_inode;
    }
    
    printf("ext2 signature is %hx\n", spb.e_signature);
    printf("major version is %u\n", spb.v_major);

    struct inode root;
    readInode(2, &root);
    printf("root inode type is %x\n", root.type);
    for(uint8_t i = 0; i < 12; i++)
    {
        printf("%hhu block pointer is %u\n", i, root.direct[i]);
    }
    printf("block size is %u\n", spb.s_block);
    printf("inode per block is %u\n", spb.n_inode_per_group);

    close(in);
    return 0;
}









