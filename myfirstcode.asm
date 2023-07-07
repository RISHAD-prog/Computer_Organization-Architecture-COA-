.MODEL SMALL
.STACK 100H
.DATA

HELLO DB "MY NAME IS Rishad$"
newline db 0ah,0dh,"$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    mov ah,9
    lea dx, HELLO
    int 21h
    
    mov ah,9
    lea dx, newline
    int 21h
    
    mov ah,9
    lea dx, HELLO
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx, newline
    int 21
    
    mov ah,1
    int 21h
    mov ch,al
    
    add bh,ch
    sub bh,30h
    
    mov ah,9
    lea dx, newline
    int 21h
    
    