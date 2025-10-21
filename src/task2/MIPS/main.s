.data
###############################################################################
# change values for different test cases
# parameters length and values will be passed to $a0 and $a1
# length will always be 10 (fixed), you don't need to change it
###############################################################################
values:
        .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
length:
        .word 10

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

        lw      $a0, length             # load length
        la      $a1, values             # load address of values array
        jal     int_accum               # call accumulator function, result should be stored in $v0
        nop
        
        # Save the result before calling other functions
        sw      $v0, 20($sp)

        # Restore the result and print it
        lw      $a0, 20($sp)
        jal     printInt
        nop
        
        move    $sp, $fp                # restore registers
        lw      $ra, 28($sp)
        lw      $fp, 24($sp)
        addiu   $sp, $sp, 32            # clear stack
        jr      $ra                     # return to caller
        nop
