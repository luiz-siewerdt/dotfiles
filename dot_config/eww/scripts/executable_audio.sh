#!/bin/bash



list_sinks() {
  wpctl status |
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


case "$1" in
  --sinks) list_sinks ;;
  --sources) list_sources ;;
  *) echo "ec" ;;
esac
