#!/bin/bash

IMG="42tokyo-clang-env"

while [[ "$OSTYPE" == "darwin"* ]] && ! docker ps >/dev/null 2>&1; do
  open -a /Applications/Docker.app
  echo "Starting Docker Desktop..."
  sleep 10
done

docker run --platform linux/amd64 -it --rm -v $(pwd):/workspace $IMG
