#!/usr/bin/env bash

function dx::assert::non_empty() {
  local -r cmd_option="${1:-}"
  local -r value="${2:-}"

  if [ -z "${cmd_option}" ]; then
    dx::log::errexit "${FUNCNAME[0]:-} called with invalid arguments."
  fi

  if [ -z "${value}" ]; then
    dx::log::errexit "\"${cmd_option}\" requires an argument."
  fi
}
