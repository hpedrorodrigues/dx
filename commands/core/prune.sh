#!/usr/bin/env bash

function dx::remove_all_containers() {
  dx::docker::check_requirements

  docker ps --no-trunc --quiet --all \
    | xargs -I % docker rm --volumes --force %
}

function dx::remove_containers() {
  dx::docker::check_requirements

  docker container prune --force
}

function dx::remove_images() {
  dx::docker::check_requirements

  docker image prune --all --force
}

function dx::remove_volumes() {
  dx::docker::check_requirements

  docker volume prune --force
}

function dx::remove_networks() {
  dx::docker::check_requirements

  docker network prune --force
}

function dx::remove_all() {
  dx::docker::check_requirements

  dx::remove_all_containers

  docker system prune --force --all --volumes
}

function dx::clean_up_dirt() {
  dx::docker::check_requirements

  dx::remove_containers
  dx::remove_images
  dx::remove_volumes
  dx::remove_networks
}
