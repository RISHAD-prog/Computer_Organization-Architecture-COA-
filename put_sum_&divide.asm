.MODEL SMALL
.STACK 100H
.DATA

newline  db 0ah,0dh, "$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    mov bx,100
    mov dx,5
    mov cx,0
    loop: 
    add dx,5
    inc cx
    
    mov ah,2
    lea dx,cx
    int 21h
    
    cmp bx,100
    je exit
    jl loop
    
    exit:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN