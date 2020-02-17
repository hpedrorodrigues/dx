#!/usr/bin/env bash

function dx::delete_resource() {
  local -r resource_type="${1}"
  local -r resource_id="${2}"
  local -r description="${3}"

  dx::log::info "Do you really want to delete the ${resource_type} [${description} - ${resource_id}]? Be careful. [y/n]"
  read -e -r confirmation

  if [ "${confirmation}" = 'y' ] || [ "${confirmation}" = 'yes' ]; then
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
  fi
}

function dx::delete() {
  dx::docker::check_requirements

  if dx::system::is_command_available 'fzf'; then
    local -r resources="$(dx::list_resources)"

    if [ -z "${resources}" ]; then
      dx::log::errexit 'No resources found'
    fi

    local -r row="$(echo -e "${resources}" | fzf)"

    if [ -z "${row}" ]; then
      # User does not select any option
      exit 0
    fi

    local -r type="$(echo "${row}" | awk '{ print $1 }')"
    local -r id="$(echo "${row}" | awk '{ print $2 }')"
    local -r description="$(echo "${row}" | awk '{ print $3 }')"

    dx::delete_resource "${type}" "${id}" "${description}"
  else
    export PS3=$'\n''Type the respective resource number: '$'\n'

    local resources
    readarray -t resources < <(dx::list_resources)

    if [ "${#resources[@]}" -eq 0 ]; then
      dx::log::errexit 'No resources found'
    fi

    local type=''
    local id=''
    local description=''

    select resource in "${resources[@]}"; do
      type="$(echo "${resource}" | awk '{ print $1 }')"
      id="$(echo "${resource}" | awk '{ print $2 }')"
      description="$(echo "${resource}" | awk '{ print $3 }')"

      dx::delete_resource "${type}" "${id}" "${description}"
      break
    done
  fi
}
