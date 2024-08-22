# Use the official Ubuntu 22.04 base image for x86_64
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="your_email@example.com"

# Update the package list and install Clang 12 and other essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    clang-12 \
    clang-tools-12 \
    cmake \
    git \
    vim \
    lldb \
    wget \
    curl \
    unzip \
    python3 \
    python3-pip \
    python3.10-venv \
    && rm -rf /var/lib/apt/lists/*

# Set Clang 12 as the default compiler
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-12 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-12 100

# install norminette
RUN pip install norminette==3.3.55

# Create a non-root user with sudo privileges
RUN useradd -ms /bin/bash tkondo && echo "tkondo:password" | chpasswd && adduser tkondo sudo

# Switch to the non-root user
USER tkondo

# Insatall francinette
RUN bash -c "$(curl -fsSL https://raw.github.com/xicodomingues/francinette/master/bin/install.sh)"

# Create a workspace directory
WORKDIR /workspace

# Set the default command to open a shell
CMD ["/bin/bash"]

