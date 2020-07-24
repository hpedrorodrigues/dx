#!/usr/bin/env bash

function dx::docker::check_requirements() {
  if ! dx::system::is_command_available 'docker'; then
    dx::log::errexit 'Docker command not found in PATH'
  fi
}

function dx::list_resources() {
  docker container ls \
    --all \
    --format 'container {{.ID}} {{.Names}}'

  docker images \
    --format='image {{.ID}} {{.Repository}}:{{.Tag}}'

  docker volume ls \
    --format 'volume {{.Name}}'

  docker network ls \
    --filter 'type=custom' \
    --format 'network {{.ID}} {{.Name}}'
}

function dx::docker::containers() {
  local -r template='table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'

  docker container ls --format="${template}" "${@}" | tail -n +2
}

function dx::docker::running_containers() {
  dx::docker::containers \
    --filter 'status=running' \
    --filter 'status=restarting' \
    --filter 'status=removing'
}

function dx::docker::all_containers() {
  dx::docker::containers '--all'
}

function dx::docker::exec() {
  local -r container_id="${1}"

  docker exec -it "${container_id}" sh
}

function dx::docker::tail() {
  local -r container_id="${1}"

  docker logs --tail 1000 --follow "${container_id}"
}

function dx::docker::inspect() {
  local -r resource_id="${1}"

  docker inspect "${resource_id}"
}

function dx::docker::pid() {
  local -r container_id="${1}"

  docker inspect --format '{{.State.Pid}}' "${container_id}"
}
