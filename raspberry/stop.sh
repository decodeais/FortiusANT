#!/bin/bash
Raspberry='\033[0;35m'
ResetColor='\033[0m' 
# Check for response
if [[ $1 != "n" ]]; then
    printf "${Raspberry}Press Enter to continue, or 'Ctrl C' to stop: ${ResetColor}"
    read -r -n 1 reply
    if [[ $reply == "n" ]]; then
        echo "{Raspberry}Script stopped.${ResetColor}"
        exit 0
    fi
fi
