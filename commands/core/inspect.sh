#!/usr/bin/env bash

function dx::inspect() {
  dx::docker::check_requirements

  if dx::system::is_command_available 'fzf'; then
    local -r resources="$(dx::list_resources)"

    if [ -z "${resources}" ]; then
      dx::log::errexit 'No resources available'
    fi

    echo -e "${resources}" \
      | fzf --multi \
      | while read -r resource; do
        [ -n "${resource}" ] \
          && dx::docker::inspect $(echo "${resource}" | awk '{ print $2 }')
      done
  else
    export PS3=$'\n''Type the respective resource number: '$'\n'

    local resources
    readarray -t resources < <(dx::list_resources)

    if [ "${#resources[@]}" -eq 0 ]; then
      dx::log::errexit 'No resources available'
    fi

    select resource in "${resources[@]}"; do
      dx::docker::inspect $(echo "${resource}" | awk '{ print $2 }')
      break
    done
  fi
}
