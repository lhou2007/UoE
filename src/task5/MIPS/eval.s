.data
prompt_a:
        .asciiz "a: "
prompt_b:
        .asciiz "b: "
result_msg:
        .asciiz "a > b = "

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
        addiu   $sp, $sp, -64
        sw      $ra, 60($sp)
        sw      $fp, 56($sp)
        sw      $s0, 52($sp)
        sw      $s1, 48($sp)
        move    $fp, $sp

        # la      $a0, prompt_a
        # jal     printString
        # nop
        jal     readInt
        nop
        move    $s0, $v0

        # la      $a0, prompt_b
        # jal     printString
        # nop
        jal     readInt
        nop
        move    $s1, $v0

        move    $a0, $s0
        move    $a1, $s1
        jal     float_is_greater
        nop
        move    $t0, $v0

        # la      $a0, result_msg
        # jal     printString
        # nop
        move    $a0, $t0
        jal     printInt
        nop

        move    $sp, $fp
        lw      $ra, 60($sp)
        lw      $fp, 56($sp)
        lw      $s0, 52($sp)
        lw      $s1, 48($sp)
        addiu   $sp, $sp, 64
        jr      $ra
        nop