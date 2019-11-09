#!/usr/bin/env bash

readonly library_path="${DXC_HOME}/shared/library"

# shellcheck source=commands/shared/library/assert.sh
source "${library_path}/assert.sh"
# shellcheck source=commands/shared/library/docker.sh
source "${library_path}/docker.sh"
# shellcheck source=commands/shared/library/logging.sh
source "${library_path}/logging.sh"
# shellcheck source=commands/shared/library/system.sh
source "${library_path}/system.sh"
