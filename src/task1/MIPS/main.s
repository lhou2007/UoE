.data
###############################################################################
# change values for different test cases
# parameters a and b will be passed to $a0 and $a1
###############################################################################
        a: .word 100
        b: .word 2

.text

###############################################################################
# main function - entry point to call user-defined _main
# After _main returns, it exits the program
###############################################################################
main:
        jal     _main
        nop
        li      $v0, 10                 # exit
        syscall

###############################################################################
# _main function
# This is the actual user-defined main function
###############################################################################
_main:
        addiu   $sp, $sp, -32           # preserve registers
        sw      $ra, 28($sp)            # save return address
        sw      $fp, 24($sp)
        move    $fp, $sp

        lw      $a0, a
        lw      $a1, b
        jal     int_add                 # call adder function, result should be stored in $v0
        nop

        move    $a0, $v0                # move result to $a0 for printInt
        jal     printInt
        nop

        move    $sp, $fp                # restore registers
        lw      $ra, 28($sp)
        lw      $fp, 24($sp)
        addiu   $sp, $sp, 32            # clear stack
        jr      $ra                     # return to caller
        nop