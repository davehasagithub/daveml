file="$1"

if [ -n "$TERM" ] && [ -r "$file" ]; then
  ESC="\e"

  if [[ "$TERM" == *color* ]]; then
    BBG="${ESC}[37;44;1m"
    GGG="${ESC}[32m"
    CCC="${ESC}[36m"
    BBF="${ESC}[31;1m"
    CLR="${ESC}[0m"
  fi

  perl -pe "
    s/^(.*?)<BBG>/\$1$BBG/g;
    s/^(.*?)<GGG>/\$1$GGG/g;
    s/^(.*?)<CCC>/\$1$CCC/g;
    s/^(.*?)<BBF>/\$1$BBF/g;
    s/^(.*?)<CLR>/\$1$CLR/g;
    s/^(.*?${ESC}.*)$/\$1$CLR/g;
    s/^/| /g;
  " \
  "$file"
fi
