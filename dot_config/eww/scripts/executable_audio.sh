#!/bin/bash

no_match_sink_names=("Radeon" "Navi")

list_sinks() {
  grep_regex=""

  for name in "${no_match_sink_names[@]}"; do
    grep_regex+="${name}|"
  done

  grep_regex="${grep_regex%|}"

  wpctl status |
  grep -vE "(${grep_regex})" |
  awk '
  /Sinks:/ {flag=1; next}
  /Sources:/ {flag=0}
  flag {
    gsub(/^[ \t│]+/, "")

    is_default="false"

    if ($1 == "*") {
      is_default="true"
      $1=""
      gsub(/^[ \t│]+/, "")
    }

    match($0, /^[0-9]+/)
    id = substr($0, RSTART, RLENGTH)

    sub(/^[0-9]+\. /, "")
    sub(/ [[:space:]]*\[vol:.*\]/, "")

    name = $0

    if (id == "" || name == "") next

    printf("{\"id\":%s,\"name\":\"%s\",\"default\":%s}\n", id, name, is_default)
  }' | jq -s "."
}

list_sources() {
  wpctl status |
  awk '
  /Sources:/ {flag=1; next}
  /Filters:/ {flag=0}
  flag {
    gsub(/^[ \t│]+/, "")

    is_default="false"

    if ($1 == "*") {
      is_default="true"
      $1=""
      gsub(/^[ \t│]+/, "")
    }

    match($0, /^[0-9]+/)
    id = substr($0, RSTART, RLENGTH)

    sub(/^[0-9]+\. /, "")
    sub(/ [[:space:]]*\[vol:.*\]/, "")

    name = $0

    if (id == "" || name == "") next

    printf("{\"id\":%s,\"name\":\"%s\",\"default\":%s}\n", id, name, is_default)
  }' | jq -s "."
}


set_default() {
  wpctl set-default "$1";

  pactl list short sink-inputs | awk '{print $1}' | while read -r ID; do
    pactl move-sink-input "$ID" @DEFAULT_SINK@
  done
}


option="$1"
param="$2"


case "$1" in
  --sinks) list_sinks ;;
  --sources) list_sources ;;
  --set-default) set_default "$param" ;;
  *) echo "ec" ;;
esac
