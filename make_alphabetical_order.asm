.MODEL SMALL
.STACK 100H
.DATA
INPUT DB 3fh,"$"   
thanks DB "Thank You$"
newline db 0ah, 0dh , "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    mov ah, 9
    lea dx, INPUT
    int 21h
    
    mov ah, 1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov ch, al
    
    cmp bh,ch
    jg  first_condition
    jl  second_condition
    
    first_condition: 
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,2
    lea dl,ch
    int 21h
    
    mov ah,2
    lea dl,bh
    int 21h
    jmp exit
    
    second_condition:
    mov ah,9
    lea dx,newline
    int 21h
  
    mov ah,2
    lea dl,bh
    int 21h
    
    mov ah,2
    lea dl,ch
    int 21h
    jmp exit 
    
    exit:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN