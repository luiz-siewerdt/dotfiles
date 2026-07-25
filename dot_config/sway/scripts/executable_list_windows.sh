#!/bin/bash

swaymsg -t get_tree |
jq -r '
.. | objects
| select(.type == "workspace")
| .name as $ws
| (.nodes + .floating_nodes)
| .. | objects
| select(.type == "con" and .name != null)
| "\($ws): \(.name) [\(.app_id // "unknown")]"
'

echo "$windows"
