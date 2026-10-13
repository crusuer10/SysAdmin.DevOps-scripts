#!/usr/bin/env bash

# This script takes the /etc/passwd file and extracts info
# such as users and groups into a colourised report-like format.

# License: MIT

clear
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'
   [[ ! -f /etc/passwd ]] && { printf "/etc/passwd not found.\n"; exit 1; }
        USR=$( awk -F: '{ print $1 }' /etc/passwd )
        PRINT=$( awk -F: '{ print $1 ": " $7 }' /etc/passwd )
        COUNT=$( printf "$USR\n" | wc -l )

        printf  "${GREEN}_____________________${NC}

        ${GREEN}Users found: ${PURPLE}$COUNT ${NC} ${NC}
        ${PURPLE}$PRINT  ${NC}
        ${GREEN}_____________________${NC}
                                                  \n"


           printf "${GREEN}GROUPS${NC}\n"
             for user in $USR; do
                GROUP=$( groups $user | cut -d: -f2)  && echo -e "${PURPLE}[$] $user ${NC} in the group: $GROUP ${NC}"
                [[ $(whoami) = $user ]] && echo -e "${GREEN}[+] currently dressed as $user ${NC}"
                done
           printf "${GREEN}__________________${NC}\n"
       echo
