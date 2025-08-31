print_new_line proc
    mov AH, 02h
    
    mov DL, 0Dh
    int 21h
    
    mov DL, 0Ah
    int 21h
    
    ret
print_new_line endp

clear_screen proc
    ; use BIOS interrupt to clear screen by scrolling entire page
    mov ah, 06h        ; scroll up function
    mov al, 0          ; clear entire window
    mov bh, 07h        ; attribute (white on black)
    mov cx, 0          ; upper left corner (row=0, col=0)
    mov dx, 184Fh      ; lower right corner (row=24,col=79)
    int 10h
    ; reset cursor to 0,0
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    ret
clear_screen endp