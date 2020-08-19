.global merge

;merge function
;args
;$a0->arr[]
;$a1->l
;$a2->m
;$a3->r
;local vars
;$t0->i
;$t1->j
;$t2->k
;$t3->n1
;$t4->n2
;$t5->L[n1]
;$t6->R[n2]

merge:
;init i and j
move $t0,$zero
move $t1,$zero

;= m-l
sub $t7,$a2,$a1

;=+1
addi $t7,$t7,1

;n1=result
move $t3,$t7

;store = r-m in $t7
sub $t7,$a3,$a2

;n2=r-m
move $t4,$t7

;copy data to temp arrays L [] and R[]


for_1:

slt $t7,$t0,$t3

beq $t7,$zero,for_1_end

;obtener arr[l+i]

add $t8,$t0,$a1

sll $t8,$t8,2

add $t8,$t8,$a0

;almacenar contenidos de arr[l+i] en $t9
lw $t9,0($t8)

;obtener L[i]
sll $t3,$t0,2

add $t3,$t3,$t5

;obtener L[i]
lw $t3,0($t3)

;L[i] = arr[l+i]
sw $t9,0($t3)
for_1_end:

addi $t0,$t0,1

j for_1

;variables $t7,$t8,$t9,$t3,$t4 usable

for_2:

slt $t7,$t1,$t4

beq $t7,$zero,for_2_end

;obtener [m+1+j]

addi $t8,$a2,1
add $t8,$t7,$t1

sll $t8,$t8,2

add $t8,$t8,$a0

;almacenar contenidos de $t8 en $t9

lw $t8,0($t9)

;obtener R[j]

sll $t9,$t1,2

;offset
add $t9,$t9,$t6

lw $t3,0($t9)

;R[j] = arr[m+1+j]

sw $t9,0($t3)

for_2_end:

addi $t1,$t1,1

j for_2

;k=l
move $t2,$a1

;variables $t7,$t8,$t9 usable
   
first_while:

slt $t7,$t0,$t3
slt $t8,$t1,$t4

beq $t7,$t8, true

true:

bne $t5,$t6,else



    addi $t0,$t0
else:


addi $t1,$t1,1

first_while_end:

addi $t2,$t2,1

j first_while

second_while:

addi $t0,$t0,1
addi $t2,$t2

second_while_end:

j second_while

third_while:


addi $t1,$t1,1
addi $t2,$t2,1


third_while_end:

j third_while




    
    
    
    

