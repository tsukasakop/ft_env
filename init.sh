#!/bin/bash

IMG="42tokyo-clang-env"
DIR="$(cd "$(dirname "$0")" && pwd)"
BASHRC="$DIR/home/.bashrc"
DOCKERFILE="$DIR/Dockerfile"

append-dotfiles()
{
  if [[ "$TERM_PROGRAM" == "WarpTerminal" ]]; then
    grep "SourcedRcFileForWarp" $BASHRC >/dev/null || echo "printf '\\eP\$f{\"hook\": \"SourcedRcFileForWarp\", \"value\": { \"shell\": \"bash\"}}\\x9c'" >>$BASHRC
  fi
}

build()
{
  docker build --platform linux/amd64 -f $DOCKERFILE -t $IMG .
}

add-alias()
{
  grep "# 42env" ~/.zshrc >/dev/null || cat <<EOF >>~/.zshrc
# 42env
alias 42env="$REALPATH/run.sh"
EOF
}

append-dotfiles
build
add-alias
