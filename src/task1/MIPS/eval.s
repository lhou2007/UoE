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

        jal readInt
        nop
        move    $a0, $v0
        jal readInt
        nop
        move    $a1, $v0
        jal     int_add
        nop

        move    $a0, $v0
        jal     printInt
        nop

        move    $sp, $fp
        lw      $ra, 28($sp)
        lw      $fp, 24($sp)
        addiu   $sp, $sp, 32
        jr      $ra
        nop