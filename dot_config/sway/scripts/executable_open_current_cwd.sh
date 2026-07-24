#!/bin/bash

terminal_pid=$(swaymsg -t get_tree | jq '.. | select(.focused? == true).pid')

shell_pid=$(pstree -pa "$terminal_pid" \
  | grep -E "zsh|bash" \
  | grep -Eo '[0-9]+' \
  | head -1)


cwd=$(readlink /proc/"$shell_pid"/cwd)

foot --working-directory "$cwd"
