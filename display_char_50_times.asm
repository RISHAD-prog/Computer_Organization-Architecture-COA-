.MODEL SMALL
.STACK 100H
.DATA
INPUT DB "Enter the character: $"   
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
    mov bh, al
    
    mov ch,bh
    sub ch,20h
    
    mov ah, 9
    lea dx, newline
    int 21h 
    
    mov ah, 2
    lea dl, ch
    int 21h
    mov cx, 50
    loop:
    mov ah,2
    lea dl,bh
    int 21h
    dec cx
    cmp cx,1
    jg loop
    je exit
    
    exit:
    mov ah, 9
    lea dx, newline
    int 21h
    mov ah, 9
    lea dx, newline
    int 21h
    mov ah, 9
    lea dx, thanks
    int 21h
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN