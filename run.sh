#!/bin/bash

IMG="42tokyo-clang-env"

docker run --platform linux/amd64 -it --rm -v $(pwd):/workspace $IMG
