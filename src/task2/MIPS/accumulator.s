.text

.globl int_accum

int_accum:
    # Initialize sum = 0
    move    $v0, $zero         # sum = 0
    # Initialize i = 0
    move    $t0, $zero         # i = 0
    # Set temporary value for loop limit (10)
    li      $t1, 10            # temp = 10 (loop counter limit)
    
loop:
    # Load a[i] into $t3 (assuming $s0 holds the base address of array 'a')
    lw      $t3, 0($s0)        # temp1 = a[i]
    add     $v0, $v0, $t3      # sum += a[i]
    
    # Increment the address of a[i] by 4 (size of an integer)
    addi    $s0, $s0, 4        # addr of a[i+1]
    
    # Increment i
    addi    $t0, $t0, 1        # i = i + 1
    
    # Check if i < 10, if not, exit loop
    bne     $t0, $t1, loop     # if i < 10, continue loop
    
    # Return from function when done
    jr      $ra                 # return to the caller
