#!/usr/bin/env bash

function dx::pid() {
  dx::docker::check_requirements

  if dx::system::is_command_available 'fzf'; then
    local -r containers="$(dx::docker::running_containers)"

    if [ -z "${containers}" ]; then
      dx::log::errexit 'No running containers available'
    fi

    local -r row="$(echo -e "${containers}" | fzf)"
  else
    export PS3=$'\n''Type the respective container number: '$'\n'

    local containers
    readarray -t containers < <(dx::docker::running_containers)

    if [ "${#containers[@]}" -eq 0 ]; then
      dx::log::errexit 'No running containers available'
    fi

    select option in "${containers[@]}"; do
      local -r row="${option}"
      break
    done
  fi

  [ -n "${row}" ] \
    && dx::docker::pid "$(echo "${row}" | awk '{ print $1 }')"
}
