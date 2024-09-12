#!/bin/bash

NAME="42tokyo-clang-env"

start-docker() {
  while [[ "$OSTYPE" == "darwin"* ]] && ! docker ps >/dev/null 2>&1; do
    open docker-desktop://
    echo "Starting Docker Desktop..."
    sleep 10
  done
}

run() {
  if [ "$1" != "-r" ]; then
    docker run --platform linux/amd64 -it --rm -v "$(pwd)":/workspace $NAME
    exit
  else
    if [ ! "$(docker ps -aq -f name=$NAME)" ]; then
      docker run --platform linux/amd64 -it -d --name $NAME -v "$(pwd)":/workspace $NAME
    elif [ ! "$(docker ps -q -f name=$NAME)" ]; then
      docker start $NAME
    fi
    docker exec -it $NAME /bin/bash
  fi
}

start-docker
run "$@"
