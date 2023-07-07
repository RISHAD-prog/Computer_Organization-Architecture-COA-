.MODEL SMALL
.STACK 100H
.DATA
INPUT DB 2ch,"$"
thanks DB "Thank You$"
newline db 0ah, 0dh , "$"



.CODE
MAIN PROC
 MOV AX, @DATA
 MOV DS, AX

 mov ah,1
 int 21h
 mov bh, al

 mov ah,9
 lea dx,INPUT
 int 21h

 mov ah,1
 int 21h
 mov ch, al

 cmp bh,35h
 jg greater
 jl lesser
 jmp exit
 greater:
 cmp ch,35h
 jg sum

 lesser:
 cmp ch,35h
 jl multi
 jmp exit
 sum:
 mov dh,bh
 add dh,ch
 sub dh,30h

 mov ah,2
 lea dl,dh
 int 21h
 jmp exit

 multi:
 mov ah,9
 lea dx,newline
 int 21h

 mov dh,30h

 f:
 add dh,ch
 sub dh,30h

 dec bh
 cmp bh,30h
 jg f


 
 mov ah,2
 lea dl,dh
 int 21h

 
 exit:
 MOV AH, 4CH
 INT 21H
 MAIN ENDP
END MAIN