.MODEL SMALL
.STACK 100H
.DATA
comma DB 2ch, "$"
newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    
    
    
    mov ah,2 
    lea dx,255
    int 21h
    
     
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
      