.MODEL SMALL
.STACK 100H
.DATA
first_input DB "PLEASE ENTER FIRST VALUE: $"
second_input DB "PLEASE ENTER SECOND VALUE: $"
newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    mov ah, 9
    lea dx, first_input
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 9
    lea dx, second_input
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al
    
    mov ah, 9
    lea dx, newline
    int 21h
      
    sub bh, ch
    add bh, 30h    
    
    mov ah,2
    mov dl,bh
    int 21h
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN