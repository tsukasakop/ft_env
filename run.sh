#!/bin/bash

IMG="42tokyo-clang-env"

if [[ "$OSTYPE" == "darwin"* ]]; then
  docker ps >/dev/null || open -a /Application/Docker.app
fi

docker run --platform linux/amd64 -it --rm -v $(pwd):/workspace $IMG
