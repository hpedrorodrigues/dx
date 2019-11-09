#!/usr/bin/env bash

function dx::system::is_command_available() {
  local -r cmd="${1:-}"

  if [ -z "${cmd}" ]; then
    dx::log::errexit 'You must provide a command to check'
  fi

  hash "${cmd}" 2>/dev/null
}
