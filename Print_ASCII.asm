.MODEL SMALL
.STACK 100H
.DATA

newline db 0ah,0dh, "$"
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     mov ax,0
     
     PRINT:
     inc ax
     mov ah,2
     lea dx,ax
     int 21h
     cmp ax,255
     jl  PRINT   
     je  exit
     
     exit:
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END  MAIN