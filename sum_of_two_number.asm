.MODEL SMALL
.STACK 100H
.DATA
nam DB 21h, "$"
first_line db "The sum of $"
next_line db " and $"
third db "= $"   
error db "value is out of bound $"
newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
        
        
    mov ah, 9
    lea dx, nam
    int 21h
    
    mov ah, 1
    int 21h
    mov bh,al
    
    mov ah, 1
    int 21h
    mov ch,al 
             
    mov ah, 9
    lea dx,newline
    int 21h
    
    mov ah, 9
    lea dx,first_line
    int 21h
    
    mov ah, 2
    mov dl, bh
    int 21h 
           
    mov ah, 9
    lea dx,next_line
    int 21h
    
    mov ah, 2
    mov dl, ch
    int 21h       
    
    mov ah, 9
    lea dx,third
    int 21h
           
    add bh, ch
    sub bh,30h
    cmp bh,39h
    jg  error_value
    jle output 
    
    error_value:
    mov ah, 9
    lea dx,error
    int 21h
    jmp exit      
    
    output:       
    mov ah, 2
    mov dl,bh
    int 21h
     
    
    exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN