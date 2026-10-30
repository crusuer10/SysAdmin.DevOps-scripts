#!/usr/bin/env bash


[[ $# -eq 0 ]] && exit 1

while IFS= read -r _line; do

   # Detect function's start
   [[ "${_line}" =~ ^[[:space:]]*[a-zA-Z0-9_]+\(\)[[:space:]]*\{ ]] && enable=1

     # Printing  function's content
     (( enable )) && {
           [[ "${_line}" =~ "#>FUNCTION" ]] && continue
           [[ "${_line}" =~ "#<FUNCTION" ]] && continue
           printf '%s\n' "${_line}"
     }

     # End.
     (( enable )) && [[ "${_line}" =~ ^[[:space:]]*\}[[:space:]]*$ ]] && enable=0

done < "${1}"
