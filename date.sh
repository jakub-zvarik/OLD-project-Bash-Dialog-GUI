#!/bin/bash

#FUNCTION TO SHOW DATE AND TIME IN DIALOG MSGBOX
show_date () {
    dialog --title "Date and Time" --msgbox "Today's date is $1" 0 0
}

#SET UP DATE & TIME TO VARIABLE "NOW"
now=$(date)

#CALL FUNCTION
show_date "$now"