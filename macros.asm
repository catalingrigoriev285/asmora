print_string macro input_string
    mov AH, 09h
    mov DX, offset input_string
    int 21h
endm

print_char macro input_char
    mov AH, 02h
    mov DL, input_char
    int 21h
endm