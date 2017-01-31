.ifndef _nios2_macros_
.equ _nios2_macros_,1

    #--------------------
    # GEQU symbol, value
    #
    # Macro to define a global symbol
    .macro  GEQU sym,val
    .global \sym
    .equ \sym,\val
    .endm

    #--------------------
    # GFUNC symbol
    #
    # Macro to define a global function
    .macro  GFUNC sym
    .global \sym
    .type \sym, @function
    \sym:
    .endm

    #--------------------
    # MOVI32 $reg, imm32
    #
    # Macro to move a 32-bit immediate into a register.
    .macro  MOVI32 reg, val
    movhi \reg, %hi(\val)
    ori \reg, \reg, %lo(\val)
    .endm

	#--------------------
	# MOVIA $reg, address
	#
    # Macro to move a 32-bit address into a register.
    .macro  MOVIA reg, addr
    movhi \reg, %hi(\addr)
    ori \reg, \reg, %lo(\addr)
    .endm

# +----------------------------
# | MOVIK32 reg,value
# |
# | for constants only, no linker action
# | uses only one instruction if possible
# |

    .macro MOVIK32 _dst,_val
    .if   (\_val & 0xffff0000) == 0
        MOVUI \_dst,%lo(\_val)
    .elseif (\_val & 0x0000ffff) == 0
        MOVHI \_dst,%hi(\_val)
    .else
        MOVHI \_dst,%hi(\_val)
        ORI   \_dst,\_dst,%lo(\_val)
    .endif
    .endm


.endif # _nios2_macros_

# end of file
