.MODEL SMALL
.STACK 100H
.DATA
nam DB "Asif Hasan $"
varsity DB "American International University-Bangladesh $" 
city DB "Dhaka $"
country DB "Bangladesh $"

newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
        
        
    mov ah, 9
    lea dx, nam
    int 21h
    
    mov ah, 9
    lea dx, newline
    int 21h
     
    mov ah, 9
    lea dx, varsity
    int 21h
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 9
    lea dx, city
    int 21h
    
    mov ah, 9
    lea dx, newline
    int 21h 
    
    mov ah, 9
    lea dx, country
    int 21h
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN