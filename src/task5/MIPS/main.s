.data
###############################################################################
# change values for different test cases
# parameters a and b (32-bit floating point values) will be passed to $a0 and $a1
###############################################################################
         a: .word 0x3F000000 # 0b00111111000000000000000000000000
         b: .word 0x3E800000 # 0b00111110100000000000000000000000
        
        result_msg:
                .asciiz "a > b = "

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
# Compares two 32-bit floating point values and prints result (1 if a > b, 0 otherwise)
###############################################################################
_main:
        addiu   $sp, $sp, -64           # preserve registers
        sw      $ra, 60($sp)            # save return address
        sw      $fp, 56($sp)
        sw      $s0, 52($sp)
        sw      $s1, 48($sp)
        move    $fp, $sp

        lw      $a0, a                  # load first floating point value
        lw      $a1, b                  # load second floating point value

        jal     float_is_greater        # call comparison function, result in $v0 (1 if a > b, 0 otherwise)
        nop
        move    $t0, $v0                # save comparison result

        # Print result message
        la      $a0, result_msg
        jal     printString
        nop
        
        # Print comparison result
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
