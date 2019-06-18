if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="green"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
NEWLINE='
'

PROMPT='%{${fg_bold[blue]}%}%m%{$reset_color%} %{${fg[green]}%}%3~$NEWLINE%{${fg_bold[$CARETCOLOR]}%}$%{${reset_color}%} '

RPS1="${return_code}"
