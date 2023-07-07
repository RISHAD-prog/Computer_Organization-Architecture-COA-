.MODEL SMALL
.STACK 100H
.DATA
first_input db "Enter first input: $" 


newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX
    
    mov ch,30h
    mov dh,30h
    jmp input
    input:
    cmp dh,36h
    je  output
    mov ah,1
    int 21h
    mov bh,al
    inc dh
    
    cmp bh,31h
    je  increment
    jne input
         
    
    
    increment:
    inc ch
    jmp input
    output:  
    mov ah,9
    lea dx,newline 
    int 21h
    
    mov ah,2
    lea dl,ch
    int 21h
    
    
    
    exit:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN