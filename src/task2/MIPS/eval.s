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
        addiu   $sp, $sp, -112
        sw      $ra, 108($sp)
        sw      $fp, 104($sp)
        sw      $s0, 100($sp)
        sw      $s1, 96($sp)
        sw      $s2, 92($sp)
        move    $fp, $sp

        li      $s0, 10
        move    $s1, $zero
        addiu   $s2, $fp, 16

read_loop:
        slt     $t2, $s1, $s0
        beq     $t2, $zero, read_done
        nop

        # la      $a0, prompt_value
        # jal     printString
        # nop
        jal     readInt
        nop

        move    $t3, $s1
        sll     $t4, $t3, 2
        addu    $t5, $s2, $t4
        sw      $v0, 0($t5)

        addiu   $s1, $s1, 1
        b       read_loop
        nop

read_done:
        move    $a0, $s0
        addiu   $a1, $fp, 16
        jal     int_accum
        nop
        move    $a0, $v0

        # la      $a0, result_msg
        # jal     printString
        # nop
        # move    $a0, $t0
        jal     printInt
        nop
        # jal     printLn
        # nop

        move    $sp, $fp
        lw      $ra, 108($sp)
        lw      $fp, 104($sp)
        lw      $s0, 100($sp)
        lw      $s1, 96($sp)
        lw      $s2, 92($sp)
        addiu   $sp, $sp, 112
        jr      $ra
        nop
