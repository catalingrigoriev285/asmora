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
    mov output_string[SI], '$'
endm

; compare
compare_string macro string1, string2, label_equal, label_notequal
    LOCAL compare_string_loop
    push SI
    push DI
    
    lea SI, string1
    lea DI, string2
    
compare_string_loop:
    lodsb
    mov BL, [DI]
    inc DI
    
    cmp AL, BL
    jne label_notequal
    
    cmp AL, '$'
    je label_equal
    
    jmp compare_string_loop
    
    pop DI
    pop SI
endm