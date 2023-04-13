#!/bin/bash

#JAKUB ZVARIK
# SCRIPT WITH MAIN MENU TO:
# SHOW DATE & TIME, CALENDAR, DELETE FILE, SYSTEM INFO

# CREATE TERMINAL VARIABLE TO PASS STDERR TO TERMINAL AS OUTPUT
TERMINAL=$(tty)

# DIALOG MENU
# WHILE LOOP FOR MENU TO RUN UNTIL USER END IT
while true
do 

    # CHOICE VARIABLE TO STORE USERS CHOICE IN MENU
    # REDIRECTION STDERR TO TTY AS STDOUT 
    CHOICE=$(dialog  --clear \
            --nocancel \
            --backtitle "CW - JAKUB ZVARIK" \
            --title "MAIN   MENU" \
            --menu \
            "Choose:" 0 0 10 \
            Date "Show current date and time" \
            Calendar "Show calendar" \
            Delete_File "Delete selected file" \
            System_Info "Show system information" \
            Exit "Exit this script" \
            2>&1 >"$TERMINAL")

    # CALL CHILD-FILE WHEN USER CHOOSE ONE OF THE CHOICES IN MENU
    # IF USER CHOOSE "EXIT" THE WHILE LOOP WILL BREAK AND SCRIPT WILL BE ENDED
    case $CHOICE in
        Date) bash date.sh
            ;;
        Calendar) bash cal.sh
            ;;
        Delete_File) bash delf.sh
            ;;
        System_Info) bash sysinfo.sh
            ;;
        Exit) break
            ;;     
    esac

done