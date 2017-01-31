
ENTRY (_begin)

SECTIONS

{
  output 0x8000 :
    {
		*(.reset)
		*(.text)
		*(.rodata)
		*(.data)
		*(.sdata)
		 __bss_start = .;
		*(.bss)
		*(.sbss)
	}
  _gp = ALIGN(16);
  PROVIDE(gp = _gp);


  _end = .;

  PROVIDE (end = .);
}


