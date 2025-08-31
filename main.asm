.model small
.stack 100h
.data
    ; program data
    asmora_version db "1.0", '$'
    asmora_author db "Catalin Grigoriev", '$'
    asmora_uname_command db "asmora > ", '$'

    ; messages
    msg_welcome db "Welcome to Asmora", '$'
    msg_welcome_created_by db "Created by ", '$'
    
    msg_commands_available db "Available commands : ", '$'
    msg_commands_clear db "- clear ( Clears the asmora screen )", '$'
    msg_commands_echo db "- echo ( Print text to screen )", '$'
    msg_commands_exit db "- exit ( Close the asmora session )", '$'
    
    msg_invalid_command db "Invalid command! For more commands type 'help'.", '$'
    msg_enter_await db "Press enter to continue ...", '$'
    
    ; session
    session_input db 12 DUP('$')
    
    ; commands
    cmd_help db "help", '$'
    cmd_clear_screen db "clear", '$'
    cmd_echo db "echo", '$'
    cmd_exit db "exit", '$'
.code

include macros.asm
include procs.asm

MAIN:
MAIN_INIT:
    mov AX, @data
    mov DS, AX
    
    ; welcome message
    print_string msg_welcome
    print_char ' '
    print_string asmora_version
    
    call print_new_line
    
    print_string msg_welcome_created_by
    print_char ' '
    print_string asmora_author
    
    call print_new_line
    call print_new_line
    
MAIN_LOOP:
    print_string asmora_uname_command
    read_string session_input
    
MAIN_COMPARE_LEXICAL:
    compare_string session_input, cmd_help, COMMAND_HELP, CHECK_LEXICAL_CLEAR_SCREEN
CHECK_LEXICAL_CLEAR_SCREEN:
    compare_string session_input, cmd_clear_screen, COMMAND_CLEAR_SCREEN, CHECK_LEXICAL_ECHO
CHECK_LEXICAL_ECHO:
    compare_string session_input, cmd_echo, COMMAND_ECHO, CHECK_LEXICAL_EXIT
CHECK_LEXICAL_EXIT:
    compare_string session_input, cmd_exit, COMMAND_EXIT, INVALID_COMMAND
    
INVALID_COMMAND:
    print_string msg_invalid_command
    call print_new_line
    jmp MAIN_LOOP
    
; commands
include commands.asm
    
MAIN_END:
    mov AH, 4Ch
    int 21h
end MAIN