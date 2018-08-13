// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#pragma once

#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "utils.h"
#include "system.h"


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


int ext2_init();
int ext2_findRootFile(char *name, struct inode *inode);
int ext2_readall(struct inode *inode, void *buf);



