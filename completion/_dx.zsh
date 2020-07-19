#compdef dx

_dx() {
  local subcommand="${words[2]}"

  if [ "${subcommand}" = 'prune' ]; then
    _arguments \
      "2: :(containers images volumes networks dirt all)"
  else
    _arguments \
      "(- *): :(ls exec logs inspect delete prune pid)"
  fi
}

_dx "${@}"
