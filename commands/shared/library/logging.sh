#!/usr/bin/env bash

function dx::log::info() {
  local message="${*}"

  [ -n "${message}" ] && echo -e "${message}"
}

function dx::log::err() {
  local message="${*}"

  [ -n "${message}" ] && dx::log::errn "!!! ${message}"
}

function dx::log::errn() {
  local message="${*}"

  [ -n "${message}" ] && echo -e "${message}" >&2
}

function dx::log::errexit() {
  local -r message="${*}"

  [ -n "${message}" ] && dx::log::err "${message}"

  exit 1
}
