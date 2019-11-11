_dx() {
  local prev_word="${COMP_WORDS[COMP_CWORD - 1]}"

  if [ "${#COMP_WORDS[@]}" -eq 1 ]; then
    local words=('ls' 'exec' 'logs' 'inspect' 'delete' 'clear')
  elif [ "${prev_word}" = 'clear' ]; then
    local words=('containers' 'images' 'volumes' 'networks' 'dirt' 'all')
  else
    local words=()
  fi

  while read -r line; do
    COMPREPLY+=("${line}")
  done < <(compgen -W "${words[*]}" -- "${prev_word}")
}

complete -F _dx dx
