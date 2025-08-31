.model small
.stack 100h
.data
    ; program data
    asmora_version db "1.0", '$'
    asmora_author db "Catalin Grigoriev", '$'

    welcome_msg db "Welcome to Asmora", '$'
    welcome_msg_created_by db "Created by ", '$'
.code

include macros.asm
include procs.asm

MAIN:
    mov AX, @data
    mov DS, AX
    
    ; welcome message
    print_string welcome_msg
    print_char " "
    print_string asmora_version
    
    call print_new_line
    
    print_string welcome_msg_created_by
    print_char " "
    print_string asmora_author
    

    mov AH, 4Ch
    int 21h
end MAIN