.MODEL SMALL
.STACK 100H
.DATA

newline db 0ah,0dh, "$"
msg1 db "Enter the String: $"  
r1 db "Not palindrome $"
r2 db "Palindrome $"
val1 db ?
val2 db ?
val3 db ? 
val4 db ?

.code
main proc
    mov ax, @data
    mov ds, ax
               
    mov ah,9
    lea dx,msg1
    int 21h
               
    mov ah, 1
    int 21h
    mov val1, al
    
     
    
    mov ah, 1
    int 21h
    mov val2, al
    
        
    
    mov ah, 1
    int 21h
    mov val3, al
    
    
    mov ah, 1
    int 21h
    mov val4, al     
    
    
    mov bl, val1
    mov cl, val2 
    mov dl, val3
    
    cmp bl, val4
    je  check1
    jne result2   
    
    check1:
    cmp cl,val3
    je  result1
    jne result2
    result1:
    mov ah,9
    lea dx,newline
    int 21h
    mov ah, 9 
    lea dx, r2
    int 21h
    jmp exit 
    
    result2:
    mov ah,9
    lea dx,newline
    int 21h
    mov ah, 9 
    lea dx, r1
    int 21h
                       
    exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN