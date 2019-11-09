#!/usr/bin/env bash

function dx::assert::non_empty() {
  local -r value="${1:-}"
  local -r error_message="${2:-'This value cannot be empty'}"

  if [ -z "${value}" ]; then
    dx::log::errexit "${error_message}"
  fi
}
