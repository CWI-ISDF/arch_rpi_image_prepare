#!/bin/bash
dialog --backtitle "PentestBox Build Script" --title "Welcome!" \
--msgbox "Welcome to the PentestBox Build Script. Please ensure that you have made any changes you wish to make in the ptb-config folder before continuing with this script." \
10 50

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}



while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "PentestBox Build Script" \
    --title "Main Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 3 \
    "1" "Select Device Type" \
    "2" "Change Version Number" \
    "3" "Start Build" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      clear
        dialog \
        --backtitle "PentestBox Build Script" \
        --title "Select Device Type"\
        --radiolist "Select a device:" 10 30 2 \
        1 "Raspberry Pi 1" off \
        2 "Raspberry Pi 2/3" on              
      ;;
    2 )
        dialog \
        --backtitle "PentestBox Build Script" \
        --title "Change Version Number" \
        --inputbox "Enter a version number for this image:" \
        10 20 "1.1.4"
      ;;
    3 )
      if [[ $(id -u) -eq 0 ]]; then
        result=$(du -sh /home/* 2> /dev/null)
        display_result "Home Space Utilization (All Users)"
      else
        result=$(du -sh $HOME 2> /dev/null)
        display_result "Home Space Utilization ($USER)"
      fi
      ;;
    4 )

  esac
done

