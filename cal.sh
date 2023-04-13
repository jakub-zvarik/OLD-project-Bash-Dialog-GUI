#!/bin/bash

# SET UP OUTPUT CODES
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}

# CALENDAR FUNCTION
show_cal () {
    # SET UP WHILE LOOP TO KEEP USER IN CALENDAR AFTER ANY ACTION
    while true
    do
        # SHOW DIALOG CALENDAR & STORE DATE SELECTION IN SELECTION VARIABLE 
        SELECTION=$(dialog --extra-button --extra-label "Read Notes" --stdout --date-format "%d %m %Y" --title "CALENDAR" --calendar \
        "Select a date to add note:" 0 0)

        # ACTIONS BASED ON USERS SELECTION
        # 0) CREATE DIALOG INPUTBOX TO WRITE A NOT & REDIRECT OUTPUT TO TXT FILE WHICH IS CREATED IN SCRIPT DIRECTORY
        # 1) BREAK THE WHILE LOOP AND GO BACK TO MAIN MENU
        # 3) EXTRA BUTON TO READ NOTES FROM NOTES.TXT
        case $? in
            0) dialog --title "$SELECTION" --inputbox "Enter your note:" 0 0 2>> notes.txt "$SELECTION - "
            ;;
            1) break
            ;;
            3) dialog --textbox notes.txt 0 0
        esac

        # IF USER CHOOSE TO WRITE A NOTE, THIS WILL PUT NEW LINE AFTER THE NOTE
        # JUST FOR BETTER LOOKING NOTES
        if [ $? = 0 ]
        then
            echo -e "\n" >> notes.txt
        fi 


    done
}

#CALL FUNCTION 
show_cal
