#!/bin/bash

close_other_windows() {
  current_window="$1";
  is_window_open=0


  while read -r l; do
    if [[ "$current_window" != "$l" ]]; then
      eww close "$l"
    else
      is_window_open=1
    fi
  done < <(eww active-windows | awk '{print $2}')

  echo "$is_window_open"
}


is_window_open=$(close_other_windows "$1")

if (( is_window_open == 1 )); then
  eww close "$1"
else
  eww open "$1"
fi
