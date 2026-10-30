#!/usr/bin/env bash


# A CPU burner that mimics
# it sleeps.

ms="$1"

     [ -z "$ms" ] && ms="${1:-0}"
     [[ "$ms" =~ ^[a-zA-Z]+$ ]] && { echo "Usage: $0 <milliseconds>"; exit 0; }


trap 'echo "CTRL-C pressed."; exit 130' SIGINT

     STATUS=$(echo "scale=3; $ms/1000" | bc)
     START=${EPOCHREALTIME/,/}
     SEC=$((START + ms * 1000))

    while :; do
        void=${EPOCHREALTIME/,/}
        (( void >= SEC )) && break
    done

echo "void time: $STATUS "

