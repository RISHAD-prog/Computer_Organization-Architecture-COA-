.model small
.stack 100h 
.data       

msg1 db "Enter the 1st number: $"  
msg2 db 0ah,0dh, "Enter the 2nd number: $" 
msg3 db 0ah,0dh, "Enter the 3rd number: $" 
msg4 db 0ah,0dh, "The largest number is: $"
val1 db ?
val2 db ?
val3 db ?

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
    
    mov ah,9
    lea dx,msg2
    int 21h 
    
    mov ah, 1
    int 21h
    mov val2, al
    
    mov ah,9
    lea dx,msg3
    int 21h     
    
    mov ah, 1
    int 21h
    mov val3, al     
    
    mov ah,9
    lea dx,msg4
    int 21h
    
    mov bl, val1
    mov cl, val2
    
    cmp bl, val2
    jng number1  
    
    cmp bl, val3
    jng number3
    mov dl, bl
    jmp display
    
    number1:
    cmp cl, val3
    jng number3
    mov dl, cl
    jmp display
    
    number3:
    mov dl, val3
    jmp display
                   
    display:    
    mov ah, 2 
    int 21h
    
    
    main endp
end main