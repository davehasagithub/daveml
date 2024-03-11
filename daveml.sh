#!/usr/bin/env bash

# DaveML by Dave Terrian
# https://github.com/davehasagithub/daveml/tree/main

# Color codes are: <foreground> <bold or X> <background or X>

build() {
  declare -A colors=(
    [K]="30" # black
    [R]="31" # red
    [G]="32" # green
    [Y]="33" # yellow
    [B]="34" # blue
    [M]="35" # magenta
    [C]="36" # cyan
    [W]="37" # white
  )

  declare -A styles=(
    [B]="1" # bold
    [X]=""  # default
  )

  declare -A backgrounds=(
    [K]="40"
    [R]="41"
    [G]="42"
    [Y]="43"
    [B]="44"
    [M]="45"
    [C]="46"
    [W]="47"
    [X]=""
  )

  for fg_letter in "${!colors[@]}"; do
    for bg_letter in "${!backgrounds[@]}"; do
      for fg_style_letter in "${!styles[@]}"; do
        fg_code="${colors[${fg_letter}]}"
        fg_style_code="${styles[${fg_style_letter}]}"
        bg_code="${backgrounds[${bg_letter}]}"

        code="${fg_code}"
        if [ -n "${bg_code}" ]; then
          code="${code};${bg_code}"
        fi
        if [ -n "${fg_style_code}" ]; then
          code="${code};${fg_style_code}"
        fi
        code="${code}m"

        echo "s/<${fg_letter}${fg_style_letter}${bg_letter}>/\$CLR\e[${code}/g;"
      done
    done
  done
}

file="${1:-/dev/stdin}"

CLR="\e[0m"

instructions=$(build)

# shellcheck disable=SC2116
perl -pe "
  $(echo "$instructions")
  s/<CLR>/$CLR/g;
" \
"$file" | \
  perl -pe "
    s/^(.*\e.*)$/\$1$CLR/g;
    s/^/| /g;
  "
