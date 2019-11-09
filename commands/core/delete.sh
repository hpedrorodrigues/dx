#!/usr/bin/env bash

function dx::delete_resource() {
  local -r resource_type="${1}"
  local -r resource_id="${2}"

  case "${resource_type}" in
    'container')
      docker rm --force "${resource_id}"
      ;;
    'image')
      docker rmi --force "${resource_id}"
      ;;
    'volume')
      docker volume rm --force "${resource_id}"
      ;;
    'network')
      docker network rm "${resource_id}"
      ;;
    *)
      dx::log::errexit "Unsupported resource type (${resource_type})"
      ;;
  esac
}

function dx::delete() {
  dx::docker::check_requirements

  if dx::system::is_command_available 'fzf'; then
    local -r resources="$(dx::list_resources)"

    if [ -z "${resources}" ]; then
      dx::log::errexit 'No resources found'
    fi

    local type=''
    local id=''

    echo -e "${resources}" \
      | fzf --multi \
      | while read -r resource; do

        if [ -n "${resource}" ]; then
          type="$(echo "${resource}" | awk '{ print $1 }')"
          id="$(echo "${resource}" | awk '{ print $2 }')"

          dx::delete_resource "${type}" "${id}"
        fi
      done
  else
    export PS3=$'\n''Type the respective resource number: '$'\n'

    local resources
    readarray -t resources < <(dx::list_resources)

    if [ "${#resources[@]}" -eq 0 ]; then
      dx::log::errexit 'No resources found'
    fi

    local type=''
    local id=''

    select resource in "${resources[@]}"; do
      type="$(echo "${resource}" | awk '{ print $1 }')"
      id="$(echo "${resource}" | awk '{ print $2 }')"

      dx::delete_resource "${type}" "${id}"
      break
    done
  fi
}
