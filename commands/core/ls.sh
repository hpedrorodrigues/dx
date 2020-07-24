#!/usr/bin/env bash

function dx::list() {
  dx::docker::check_requirements

  dx::log::info 'Running Containers\n'
  docker container ls \
    --filter 'status=running' \
    --filter 'status=restarting' \
    --filter 'status=removing'

  dx::log::info '\nStopped Containers\n'
  docker container ls \
    --filter 'status=created' \
    --filter 'status=paused' \
    --filter 'status=exited' \
    --filter 'status=dead'

  dx::log::info '\nImages\n'
  docker images

  dx::log::info '\nNetworks\n'
  docker network ls

  dx::log::info '\nVolumes\n'
  docker volume ls
}
