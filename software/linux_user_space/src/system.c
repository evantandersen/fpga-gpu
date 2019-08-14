// Written by:
//     Evan Andersen
//
// Created August 12, 2018


#include "system.h"

#define DEVICE_BUS_PATH "/sys/bus/platform/devices/"


void flush_dcache(void *addr, size_t len) {
#ifndef __x86_64
  char* i = addr;
  size_t cleared = 0;
  while(cleared < len) {
      __asm__ volatile ("flushda (%0)" :: "r" (i));
      i += 32;
      cleared += 32;
  }
#endif
}

void init_dcache(void *addr, size_t len) {
#ifndef __x86_64
  char* i = addr;
  size_t cleared = 0;
  while(cleared < len) {
      __asm__ volatile ("initda (%0)" :: "r" (i));
      i += 32;
      cleared += 32;
  }
#endif
}

int find_substr_in_dir(const char *dir, const char *substr, char *out) {
  DIR *dp;
  struct dirent *ep;     
  dp = opendir (dir);
  if(dp == NULL) {
    fprintf(stderr, "Couldn't open directory %s:%s\n", dir, strerror(errno));
    return -1;
  }

  while ((ep = readdir (dp))) {
    if(strstr(ep->d_name, substr)) {
      strcpy(out, ep->d_name);
      closedir (dp);
      return 0;
    }
  }
  fprintf(stderr, "Couldn't find str %s in %s\n", substr, dir);
  closedir (dp);
  return -1;
}

int find_device_uio_id(const char *device, char *out) {
  char filename[256];
  int result = find_substr_in_dir(DEVICE_BUS_PATH, device, filename);
  if(result != 0) {
    return -1;
  }
  char path[PATH_MAX];
  snprintf(path, sizeof(path), "%s/%s/uio", DEVICE_BUS_PATH, filename);
  result = find_substr_in_dir(path, "uio", filename);
  if(result != 0) {
    return -1;
  }
  if(out) {
    snprintf(out, PATH_MAX, "%s/%s/", path,filename);
  }
  return strtol(&filename[3], NULL, 10);
}

volatile void *map_uio_region(int uio_id, int n, size_t size) {
    char path[128];
    snprintf(path, sizeof(path), "/dev/uio%d", uio_id);

    int fd = open(path, O_RDWR);
    if(fd == -1) {
      fprintf(stderr, "can't open %s:%s\n", path, strerror(errno));
      return NULL;
    }

    unsigned long *mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, n*4096);
    if (mem == MAP_FAILED) {
      fprintf(stderr, "mmap %dkB of %s:%d failed:%s\n", size/1024, path, n, strerror(errno));
      mem = NULL;
    }
    close(fd);
    return mem;
}

int get_uio_property(const char *device_path, const char *property, int nmap, uint32_t *out) {
    char path[PATH_MAX];
    snprintf(path, sizeof(path), "%s/maps/map%d/%s", device_path, nmap, property);
    FILE *f = fopen(path, "r");
    if(!f) {
      return -1;
    }

    int result = fscanf(f, "0x%x", out);
    fclose(f);
    return result == 1 ? 0 : -1;
}


volatile gpu_t *init_gpu() {
  int uio_id = find_device_uio_id("gpu", NULL);
  if(uio_id < 0) {
    return NULL;
  }
  return map_uio_region(uio_id, 0, 4096);
}

vga_t *init_vga() {
  size_t fb_size = 640*480*2;
  char vga_uio_path[PATH_MAX];
  int uio_id = find_device_uio_id("vga", vga_uio_path);
  if(uio_id < 0) {
    return NULL;
  }
  volatile uint32_t *regs = map_uio_region(uio_id, 0, 4096);
  if(regs == NULL) {
    return NULL;
  }

  uint32_t fpaddr, bpaddr;
  int result1 = get_uio_property(vga_uio_path, "addr", 1, &fpaddr);
  int result2 = get_uio_property(vga_uio_path, "addr", 2, &bpaddr);
  if(result1 != 0 || result2 != 0) {
    munmap((void*)regs, 4096);
    return NULL;
  }

  uint16_t *front = (uint16_t*)map_uio_region(uio_id, 1, fb_size);
  if(front == NULL) {
    munmap((void*)regs, 4096);
    return NULL;
  }
  uint16_t *back = (uint16_t*)map_uio_region(uio_id, 2, fb_size);
  if(back == NULL) {
    munmap(front, fb_size);
    munmap((void*)regs, 4096);
    return NULL;
  }

  vga_t *vga = malloc(sizeof(vga_t));
  vga->regs = (volatile vga_registers_t*)regs;
  vga->buffers[0].vaddr = front;
  vga->buffers[0].paddr = fpaddr;
  vga->buffers[1].vaddr = back;
  vga->buffers[1].paddr = bpaddr;
  return vga;
}

