; print
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

; read
read_string macro output_string
    LOCAL read_string_loop, read_string_end
    mov SI, 0
read_string_loop:
    mov AH, 01h
    int 21h
    
    cmp AL, 13 ; enter
    je read_string_end
    
    cmp SI, 11
    je read_string_end
    
    mov output_string[SI], AL
    
    inc SI
    jmp read_string_loop
read_string_end:
endm