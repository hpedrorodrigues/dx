#!/usr/bin/env bash

readonly library_path="${DXC_HOME}/shared/library"

for library_script in "${library_path}"/*; do
  source "${library_script}"
done
