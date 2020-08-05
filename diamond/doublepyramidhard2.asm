;init iterations
li $t0,1
;limit iterations
li $t1,6
;limit spaces
li $t2,4
;limit asterisks
li $t4,1






;first half
outer_loop_start:

    ;spaces counter
    move $t3,$zero
    ;asterisk counter
    move $t5,$zero
    
    
    inner_loop_start:
    
    beq $t2,$t3,inner_loop_end
    
    li $v0,11
    li $a0,32
    syscall 
    
    addi $t3,$t3,1
    j inner_loop_start
    
    inner_loop_end:
    
    beq $t4,$t5,outer_loop_end
    
    li $v0,11
    li $a0,42
    syscall
    
    addi $t5,$t5,1
    j inner_loop_end
    
    
outer_loop_end:   

    li $v0,11
    li $a0,10
    syscall

    addi $t4,$t4,2

    addi $t0,$t0,1
    addi $t2,$t2,-1   
    
    

    
    bne $t0,$t1,outer_loop_start
    
    ; re init spaces to 0
     li $t2,0
    ; re init asterisk 9 
     li $t4,9
    ; re init iterations limit to 11
     li $t8,11
    
    j outer_loop2_start
    
    
;second half

;t0...6
;t1...6

outer_loop2_start:

    ;space counter
    move $t6,$zero
    ;asterisk counter
    move $t7,$zero 
    
    
    inner_loop2_start:
    
    beq $t6,$t2,inner_loop2_end
    
    li $v0,11
    li $a0,32
    syscall 
    
    addi $t6,$t6,1
    
    j inner_loop2_start
    
    
    inner_loop2_end:
    
    beq $t7,$t4,outer_loop2_end
    
    li $v0,11
    li $a0,42
    syscall
    
    addi $t7,$t7,1
    
    j inner_loop2_end
    
    
    


    
outer_loop2_end:

    li $v0,11
    li $a0,10
    syscall
 
    addi $t4,$t4,-2
    
    addi $t0,$t0,1
    addi $t2,$t2,1 
    
    
    
    bne $t0,$t8,outer_loop2_start
 





    
    
    
    
    

        
    
    
    
    



    


