.text

###############################################################################
# printInt function
# Prints integer to stdout
# Input: integer in $a0
# Output: None
###############################################################################
.globl printInt
printInt:
    addiu   $sp,$sp,-8
    sw      $fp,4($sp)
    move    $fp,$sp
    sw      $4,8($fp)

    li      $v0, 1
    lw      $a0, 8($fp)
    syscall

    nop
    move    $sp,$fp
    lw      $fp,4($sp)
    addiu   $sp,$sp,8
    jr      $ra


###############################################################################
# readInt function
# Reads integer from stdin
# Input: None
# Output: integer in $v0
###############################################################################
.globl readInt
readInt:
   addiu   $sp,$sp,-24
   sw      $fp,20($sp)
   move    $fp,$sp

   li      $v0, 5
   syscall

   sw $v0, 8($fp)
   lw      $2,8($fp)
   move    $sp,$fp
   lw      $fp,20($sp)
   addiu   $sp,$sp,24
   jr      $ra


###############################################################################
# printChar function
# Prints char to stdout
# Input: char in $a0
# Output: None
###############################################################################
.globl printChar
printChar:
   addiu   $sp,$sp,-8
   sw      $fp,4($sp)
   move    $fp,$sp
   move    $2,$4
   sb      $2,8($fp)

   li      $v0, 11
   lw      $a0, 8($fp)
   syscall

   nop
   move    $sp,$fp
   lw      $fp,4($sp)
   addiu   $sp,$sp,8
   jr      $ra


###############################################################################
# printString function
# Prints string to stdout
# Input: string in $a0
# Output: None
###############################################################################
.globl printString
printString:
   addiu   $sp,$sp,-8
   sw      $fp,4($sp)
   move    $fp,$sp
   sw      $4,8($fp)

   li      $v0, 4
   lw      $a0, 8($fp)
   syscall

   nop
   move    $sp,$fp
   lw      $fp,4($sp)
   addiu   $sp,$sp,8
   jr      $ra


###############################################################################
# printLn function
# Prints newline (\n) to stdout
# Input: None
# Output: None
###############################################################################
.globl printLn
printLn:
   addiu   $sp,$sp,-32
   sw      $ra,28($sp)
   sw      $fp,24($sp)
   move    $fp,$sp

   li      $4,10                 # 0xa
   jal     printChar
   nop

   nop
   move    $sp,$fp
   lw      $ra,28($sp)
   lw      $fp,24($sp)
   addiu   $sp,$sp,32
   jr      $ra
   nop


###############################################################################
# openFile function
# Open a file
# Input: File name in $a0; mode in $a1; permissions in $a2
# Output: File descriptor in $v0 (<>0 if successful)
###############################################################################
.globl openFile
openFile:
   addiu   $sp,$sp,-32
   sw      $ra,28($sp)
   sw      $fp,24($sp)
   move    $fp,$sp    

   li      $v0, 13     		# syscall for open file
   syscall
   nop

   nop
   move    $sp,$fp
   lw      $ra,28($sp)
   lw      $fp,24($sp)
   addiu   $sp,$sp,32
   jr      $ra
   nop


###############################################################################
# closeFile function
# Closes a previously opened file
# Input: File descriptor in $a0
###############################################################################
.globl closeFile
closeFile:
   addiu   $sp,$sp,-32
   sw      $ra,28($sp)
   sw      $fp,24($sp)
   move    $fp,$sp

   li      $v0, 16     		# syscall for close file
   syscall       		# close file
   nop

   nop
   move    $sp,$fp
   lw      $ra,28($sp)
   lw      $fp,24($sp)
   addiu   $sp,$sp,32
   jr      $ra
   nop


###############################################################################
# readFile function
# Reads data from a previously opened file
# Input: File descriptor in $a0; dest buffer in $a1; buffer length in $a2
# Output: bytes read (in $v0)
###############################################################################
.globl readFile
readFile:
   addiu   $sp,$sp,-32
   sw      $ra,28($sp)
   sw      $fp,24($sp)
   move    $fp,$sp

   li $v0, 14     		# syscall for read file
   syscall       		# read from file
   nop

   nop
   move    $sp,$fp
   lw      $ra,28($sp)
   lw      $fp,24($sp)
   addiu   $sp,$sp,32
   jr      $ra
   nop


###############################################################################
# printBinary32 function
# Prints 32-bit binary representation with 0b prefix
# Input: integer in $a0
###############################################################################
.globl printBinary32
printBinary32:
   addiu   $sp,$sp,-48
   sw      $ra,44($sp)
   sw      $fp,40($sp)
   sw      $s0,36($sp)
   move    $fp,$sp

   move    $s0,$a0

   li      $a0,'0'
   jal     printChar
   nop
   li      $a0,'b'
   jal     printChar
   nop

   move    $t0,$s0
   li      $t1,32
   lui     $t2,0x8000

printBinary32_loop:
   and     $t3,$t0,$t2
   beq     $t3,$zero,printBinary32_zero
   nop
   li      $a0,'1'
   jal     printChar
   nop
   b       printBinary32_next
   nop

printBinary32_zero:
   li      $a0,'0'
   jal     printChar
   nop

printBinary32_next:
   sll     $t0,$t0,1
   addiu   $t1,$t1,-1
   bgtz    $t1,printBinary32_loop
   nop

   move    $sp,$fp
   lw      $s0,36($sp)
   lw      $fp,40($sp)
   lw      $ra,44($sp)
   addiu   $sp,$sp,48
   jr      $ra
   nop
