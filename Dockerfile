# Use the official Ubuntu 22.04 base image for x86_64
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="your_email@example.com"

# Update the package list and install Clang 12 and other essential packages
RUN dpkg --add-architecture amd64 && apt-get update && apt-get install -y \
    build-essential \
    clang-12 \
    clang-tools-12 \
    cmake \
    git \
    vim \
    gdb \
    lldb \
    wget \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set Clang 12 as the default compiler
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-12 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-12 100

# Create a workspace directory
WORKDIR /workspace

# Set the default command to open a shell
CMD ["/bin/bash"]

