.text
main:
        lw      $a0, 0($sp)
        addiu   $a1, $sp, 4
        addiu   $a2, $a1, 4
        sll     $v0, $a0, 2
        addu    $a2, $a2, $v0
        jal     _main
        nop
        li      $v0, 10
        syscall

_main:
        addiu   $sp, $sp, -32
        sw      $ra, 28($sp)
        sw      $fp, 24($sp)
        move    $fp, $sp

        # Read dividend from user input
        jal     readInt
        nop
        move    $t0, $v0                 # $t0 = dividend
        
        # Read divisor from user input
        jal     readInt
        nop
        move    $t1, $v0                 # $t1 = divisor
        
        # Call int_divide with dividend and divisor
        move    $a0, $t0
        move    $a1, $t1
        jal     int_divide
        nop
        
        # Print the result
        move    $a0, $v0
        jal     printInt
        nop

        move    $sp, $fp
        lw      $ra, 28($sp)
        lw      $fp, 24($sp)
        addiu   $sp, $sp, 32
        jr      $ra
        nop
