FROM ubuntu:jammy

LABEL maintainer="tsukasakop <tsukasakop@gmail.com>" \
      version="1.1"

# Update the package
ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize

RUN apt-get update && apt-get install -y \
    build-essential \
    clang-12 \
    clang-tools-12 \
    cmake \
    lldb \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-12 100

RUN apt-get install -y man-db \
    manpages-dev \
    glibc-doc \
    libbsd-dev \
    python3-pip

RUN pip install norminette==3.3.51 \
    && bash -c "$(curl -fsSL https://raw.github.com/xicodomingues/francinette/master/bin/install.sh)"

RUN rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=

# Add files on "home" dir
ADD ./home/.bashrc /root/.bashrc

WORKDIR /workspace

CMD ["/bin/bash"]
