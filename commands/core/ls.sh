#!/usr/bin/env bash

function dx::list() {
  dx::docker::check_requirements

  dx::log::info 'Running Containers\n'
  docker container ls

  dx::log::info '\nStopped Containers\n'
  docker container ls --filter 'status=exited'

  dx::log::info '\nImages\n'
  docker images

  dx::log::info '\nNetworks\n'
  docker network ls

  dx::log::info '\nVolumes\n'
  docker volume ls
}
