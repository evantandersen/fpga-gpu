#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <fcntl.h>

int write_fb(long fb) {
    // Truncate offset to a multiple of the page size, or mmap will fail.
    

    int fd = open("/dev/uio0", O_RDWR | O_SYNC);
    if(fd == -1) {
	   perror("can't open /dev/uio0");
	   return -1;
    }
    volatile unsigned long *mem = mmap(NULL, 16, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (mem == MAP_FAILED) {
        perror("Can't map registers");
        return -1;
    }
    printf("Mapped to %p\n", mem);
    mem[1] = fb;
    return 0;
}



int main(int argc, char *argv[]) {
	if(argc != 2) {
		printf("Usage: %s <memory address>\n", argv[0]);
		return -1;
	}
	long addr = strtol(argv[1], NULL, 0);
	return write_fb(addr);	
}
