#compdef dx

_dx() {
  local subcommand="${words[2]}"

  if [ "${subcommand}" = 'clear' ]; then
    _arguments \
      "2: :(containers images volumes networks dirt all)"
  else
    _arguments \
      "(- *): :(ls exec logs inspect delete clear)"
  fi
}

_dx "${@}"
