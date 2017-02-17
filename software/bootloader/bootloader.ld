
ENTRY (_begin)

SECTIONS
{
  . = 0x8000;
  .reset : { *(.reset) }
  .text : { *(.text) }
  . = ALIGN(16);
  _gp = .;
  PROVIDE(gp = _gp);
  .sdata : { *(.sdata) }
    .data : { *(.data) }

  .rodata : { *(.rodata) }
  __bss_start = .;
  .bss : { *(.bss) }
  .sbss : { *(.sbss) }



  _end = .;

  PROVIDE (end = .);
}


