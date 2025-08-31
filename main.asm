.model small
.stack 100h
.data
    ; program data
    asmora_version db "1.0", '$'
    asmora_author db "Catalin Grigoriev", '$'
    asmora_uname_command db "asmora > ", '$'

    ; meesages
    msg_welcome db "Welcome to Asmora", '$'
    msg_welcome_created_by db "Created by ", '$'
    
    ; session
    session_input db 12 DUP(' ')
.code

include macros.asm
include procs.asm

MAIN:
MAIN_INIT:
    mov AX, @data
    mov DS, AX
    
    ; welcome message
    print_string msg_welcome
    print_char " "
    print_string asmora_version
    
    call print_new_line
    
    print_string msg_welcome_created_by
    print_char " "
    print_string asmora_author
    
    call print_new_line
    call print_new_line
    
MAIN_LOOP:
    print_string asmora_uname_command
    read_string session_input
    
MAIN_END:
    mov AH, 4Ch
    int 21h
end MAIN