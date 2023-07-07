.MODEL SMALL
.STACK 1000H
.DATA

FIRST db "Enter first input: $"
Second db "Enter Second input: $"
Output db "Output: $"
newline db 0ah,0dh, "$"
.CODE
Main PROC
     MOV AX,@DATA
     MOV DS,AX
     
     mov ah,9 
     lea dx, FIRST
     int 21h
     
     mov ah,1
     int 21h
     mov bh,al
     
     mov ah,9 
     lea dx,newline
     int 21h
     
     mov ah,9 
     lea dx,Second
     int 21h      
     
     mov ah,1
     int 21h
     mov ch,al
     
     cmp bh,ch
     jg  greater
     jl  another_greater
     
     greater:
     mov ah,9 
     lea dx,newline
     int 21h
     
     mov ah,9 
     lea dx,Output
     int 21h
     
     mov bl,bh
     
     
     mov ah,2
     lea dl,bl
     int 21h
     jmp exit
     
     another_greater:
     mov ah,9 
     lea dx,newline
     int 21h
     
     mov ah,9 
     lea dx,Output
     int 21h
     
     mov cl,ch
     
     mov ah,2
     lea dl,cl
     int 21h
     
     exit:
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN