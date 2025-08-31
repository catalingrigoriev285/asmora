print_new_line proc
    mov AH, 02h
    
    mov DL, 0Dh
    int 21h
    
    mov DL, 0Ah
    int 21h
    
    ret
print_new_line endp