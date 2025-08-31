COMMAND_HELP:
    print_string msg_commands_available
    call print_new_line
    
    print_string msg_commands_clear
    call print_new_line
    
    print_string msg_commands_echo
    call print_new_line
    
    print_string msg_commands_exit
    call print_new_line
    
    jmp MAIN_LOOP
    
COMMAND_CLEAR_SCREEN:
    call clear_screen
    jmp MAIN_LOOP
    
COMMAND_ECHO:
    read_string session_input
    
    call print_new_line
    print_string session_input
    
    call print_new_line
    jmp MAIN_LOOP
    
COMMAND_EXIT:
    jmp MAIN_END