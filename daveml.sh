file="${1:-/dev/stdin}"

if [ -n "$TERM" ]; then
  ESC="\e"

  # color codes are <foreground><bold|X><background|X>
  if [[ "$TERM" == *color* ]]; then
    WBB="${ESC}[37;44;1m" # fg:white bold bg:blue
    WBX="${ESC}[37;1m"    # fg:white bold
    GXX="${ESC}[32m"      # fg:green
    CXX="${ESC}[36m"      # fg:cyan
    RBX="${ESC}[31;1m"    # fg:red bold
    YXX="${ESC}[33m"      # fg:yellow
    YBX="${ESC}[33;1m"    # fg:yellow bold
    CLR="${ESC}[0m"       # reset
  fi

  perl -pe "
    s/<WBB>/$CLR$WBB/g;
    s/<WBX>/$CLR$WBX/g;
    s/<GXX>/$CLR$GXX/g;
    s/<CXX>/$CLR$CXX/g;
    s/<RBX>/$CLR$RBX/g;
    s/<YXX>/$CLR$YXX/g;
    s/<YBX>/$CLR$YBX/g;
    s/<CLR>/$CLR/g;
  " \
  "$file" | \

    perl -pe "
      s/^(.*?${ESC}.*)$/\$1$CLR/g;
      s/^/| /g;
    "
fi
