#!/usr/bin/env bash

# capturing user's footprints from /var/log/auth.log.

        [ -z "$USER" ] && USER=$(whoami)
             _user="${1:-$USER}"
             f="${_user}.log-cap"

        [ ! -d ~/capture/ ] && mkdir -p ~/capture/
        [ ! -f "$f" ] && cd ~/capture/ && : >"$f"


         while IFS= read -r line; do
               [[ "$line" =~ "$_user" ]] &&
               printf '%s\n'  "$line" >> ~/capture/"$f"
         done < /var/log/auth.log
