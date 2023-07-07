.MODEL SMALL
.STACK 100H
.DATA
first_input DB "Enter a number: $"
output_less DB "Less than 5 $" 
output_greater DB "greater than 5 $"
output_equal DB "equal to 5 $"

newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
        
        
    mov ah, 9
    lea dx, first_input
    int 21h
    
    mov ah, 1
    int 21h
    mov bh, al
    
    mov ah, 9
    lea dx, newline
    int 21h
     
    CMP bh, 35h
    JL  less
    JG  greater
    JE  equal
    jmp exit
    
    less:
    mov ah, 9
    lea dx, output_less
    int 21h
    jmp exit 
    
    greater:
    mov ah, 9
    lea dx, output_greater
    int 21h
    jmp exit 
    
    equal:
    mov ah, 9
    lea dx, output_equal
    int 21h
    
    exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN