.data
###############################################################################
# change values for different test cases
# parameter a (32-bit value) will be passed to get_mantissa and get_exponent
# hex value of 0b00111110000000000000000000000000
###############################################################################
        a: .word 0x3E000000

.text

###############################################################################
# main function - entry point to call user-defined _main
# After _main returns, it exits the program
###############################################################################
main:
        lw      $a0, 0($sp)
        addiu   $a1, $sp, 4
        addiu   $a2, $a1, 4
        sll     $v0, $a0, 2
        addu    $a2, $a2, $v0
        jal     _main
        nop
        li      $v0, 10                 # exit
        syscall

###############################################################################
# _main function
# This is the actual user-defined main function
# Extracts mantissa and exponent from 32-bit floating point value
###############################################################################
_main:
        addiu   $sp, $sp, -64           # preserve registers
        sw      $ra, 60($sp)            # save return address
        sw      $fp, 56($sp)
        sw      $s0, 52($sp)
        sw      $s1, 48($sp)
        move    $fp, $sp

        lw      $s0, a                  # load the 32-bit value

        # Extract mantissa (lower 23 bits)
        move    $a0, $s0
        jal     get_mantissa            # call get_mantissa function, result in $v0
        nop
        move    $s1, $v0                # save mantissa in $s1

        # Extract exponent (bits 23-30, minus bias of 127)
        move    $a0, $s0
        jal     get_exponent            # call get_exponent function, result in $v0
        nop
        move    $t0, $v0                # save exponent in $t0

        # Print mantissa
        move    $a0, $s1
        jal     printInt
        nop
        jal     printLn
        nop

        # Print exponent
        move    $a0, $t0
        jal     printInt
        nop

        move    $sp, $fp                # restore registers
        lw      $ra, 60($sp)
        lw      $fp, 56($sp)
        lw      $s0, 52($sp)
        lw      $s1, 48($sp)
        addiu   $sp, $sp, 64            # clear stack
        jr      $ra                     # return to caller
        nop
