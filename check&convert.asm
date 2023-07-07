.MODEL SMALL
.STACK 00H
.DATA
 
 newline db 0ah,0dh, "$"

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    mov ah,1
    int 21h
    mov bh,al
    
    cmp bh,5ah
    jl  capital
    jg  lower 
    capital:
    or bh,20h
    jmp print
    
    lower:
    and bh,0DFh
    jmp print
    
    print: 
    mov ah,9
    lea dx,newline
    int 21h
    mov ah,2
    lea dl,bh
    int 21h           
               
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN