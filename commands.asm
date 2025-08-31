COMMAND_HELP:
    print_string msg_welcome
    call print_new_line
    jmp MAIN_LOOP
    
COMMAND_CLEAR_SCREEN:
    call clear_screen
    jmp MAIN_LOOP