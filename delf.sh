#!/bin/bash

# SET UP OUTPUT CODES
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}

# FUNCTION TO DELETE FILES
delfi () {
    #SET UP VARIABLES
    FILE="$1"
    msg="$0"

    # CHECK IF FILE IS SELECTED
    # IF FILE IS SELECTED INVOKE YES/NO BOX TO MAKE SURE USER WANTS TO DELETE THE FILE
    # IF ANSWER IS YES (EXIT CODE 0) THEN DELETE FILE AND CONFIRM DELETION
    # IF ANSWER IS NO (EXIT CODE 1) PRINT OUT DELETION STOPPED
    # IF IT ISNT FILE PRINT OUT ERROR OCCURED
    if [ -f $FILE ]
    then
        dialog --title "Delete" --yesno "Are you sure you want to delete this $FILE?" 0 0
        if [ $? = 0 ]
        then
            /bin/rm $FILE && msg="$FILE successfuly deleted by $0."
            dialog --title "File deletion" --msgbox "$msg" 0 0
        else
            dialog --title "Delete" --msgbox "Deletion stopped. Choose another file." 0 0
        fi
    else
        dialog --title "Delete" --msgbox "Error occured." 0 0
    fi
}

# WHILE LOOP TO KEEP USER IN DELETION SECTION
# IF USER CHOOSE DELETE BUTTON (EXIT CODE 0) FUNCTION FOR DELETION IS CALLED
# IF USER CHOOSE EXIT CODE 1 WHILE LOOP WILL BREAK AND USER WILL COME BACK TO MAIN MENU
while true
do
    FILE=$(dialog --ok-label "Delete" --title "Delete file" --stdout --title "Choose a file to delete" \
    --fselect $HOME/Desktop/CW2DELFILE 0 0)

    case $? in
        0) delfi "$FILE"
        ;;
        1) break
        ;;
    esac 
done 
