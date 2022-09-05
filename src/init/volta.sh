#!/usr/bin/env bash

readonly DATA_DIR="${HOME}/.local/share"
readonly VOLTA_HOME="${DATA_DIR}/volta"

# --------------------------------------------------
# | volta setup function
# --------------------------------------------------

# 前提条件 ~/.local/shareある
# 環境変数これでいいのか

curl https://get.volta.sh | bash

volta install node
volta install yarn
