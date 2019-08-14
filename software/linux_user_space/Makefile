CC=nios2-linux-gnu-gcc
CFLAGS=-Os \
-std=gnu99 \
-ffunction-sections \
-fverbose-asm \
-mhw-mulx \
-mhw-mul \
-mhw-div \
-Wall -Werror -Wdouble-promotion \
-ffast-math \
-mno-cache-volatile \
-mcustom-fabss=224 \
-mcustom-fnegs=225 \
-mcustom-fcmpnes=226 \
-mcustom-fcmpeqs=227 \
-mcustom-fcmpges=228 \
-mcustom-fcmpgts=229 \
-mcustom-fcmples=230 \
-mcustom-fcmplts=231 \
-mcustom-round=248 \
-mcustom-fixsi=249 \
-mcustom-floatis=250 \
-mcustom-fsqrts=251 \
-mcustom-fmuls=252 \
-mcustom-fadds=253 \
-mcustom-fsubs=254 \
-mcustom-fdivs=255 \

ODIR=obj

LIBS=-lm

DEPS=src/*.h

_OBJ = gpu_driver.o system.o vector_math.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: src/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: all

all: vga model_viewer

vga: $(ODIR)/vga.o $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

model_viewer: $(ODIR)/model_viewer.o $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 

