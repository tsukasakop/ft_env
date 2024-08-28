FROM ubuntu:22.04

LABEL maintainer="tsukasakop <tsukasakop@gmail.com>" \
      version="1.0"

ADD ./home/.bashrc /root/.bashrc

# Update the package
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
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-12 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-12 100 \
    && pip install norminette==3.3.51 \
    && bash -c "$(curl -fsSL https://raw.github.com/xicodomingues/francinette/master/bin/install.sh)"

WORKDIR /workspace

CMD ["/bin/bash"]
