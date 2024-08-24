#!/bin/bash

IMG="42tokyo-clang-env"
REALPATH="$(cd "$(dirname "$0")" && pwd)"
DOCKERFILE="$REALPATH/Dockerfile"

docker build --platform linux/amd64 -f $DOCKERFILE -t $IMG .
cat <<EOF >>~/.zshrc

# 42env
alias 42env="$REALPATH/run.sh"
EOF
