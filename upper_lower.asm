.MODEL SMALL
.STACK 100H
.DATA
char DB "Enter a character: $"
error DB "no output $"

newline db 0ah, 0dh , "$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    mov ah, 9
    lea dx, char
    int 21h
    mov ah, 1
    int 21h
    mov bh, al 
    
    cmp bh,5ah
    jl  uppercase 
    jg  lowercase
    
    uppercase: 
    mov ah, 9
    lea dx, newline
    int 21h
     
    mov ah, 2
    lea dl, bh
    int 21h 
    jmp EXIT    
    
    lowercase:
    mov ah, 9
    lea dx, newline
    int 21h
    mov ah , 9
    lea dx, error
    int 21h
       
    

    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP 
END MAIN
