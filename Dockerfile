# ECE 466/566 container for easy use on Windows, Linux, MacOS

FROM ubuntu:23.10

LABEL maintainer="jtuck@ncsu.edu"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get clean \
  && apt-get install -y --no-install-recommends ssh \
      build-essential \
      gcc \
      g++ \
      gdb \
      cmake \
      rsync \
      tar \
      python3 \
      python3-pip \
      zlib1g-dev \
      bison \
      libbison-dev \
      flex \
      libfl-dev \
      libzstd-dev \
      libcurl4-openssl-dev \
   && apt-get clean


# LLVM
RUN apt-get install -y --no-install-recommends libllvm-17-ocaml-dev libllvm17 llvm-17 llvm-17-dev llvm-17-doc llvm-17-examples llvm-17-runtime && apt-get clean
# Clang and co
RUN apt-get install -y --no-install-recommends clang-17 clang-tools-17 clang-17-doc libclang-common-17-dev libclang-17-dev libclang1-17 clang-format-17 python3-clang-17 clangd-17 clang-tidy-17 && apt-get clean
# compiler-rt
RUN apt-get install -y libclang-rt-17-dev && apt-get clean
# polly
RUN apt-get install -y --no-install-recommends libpolly-17-dev && apt-get clean
# libfuzzer
RUN apt-get install -y --no-install-recommends libfuzzer-17-dev && apt-get clean
# lldb
RUN apt-get install -y --no-install-recommends  lldb-17 && apt-get clean
# lld (linker)
RUN apt-get install -y --no-install-recommends lld-17 && apt-get clean
# libc++
RUN apt-get install -y --no-install-recommends libc++-17-dev libc++abi-17-dev && apt-get clean
# OpenMP
RUN apt-get install -y --no-install-recommends  libomp-17-dev && apt-get clean
# libclc
RUN apt-get install -y --no-install-recommends libclc-17-dev && apt-get clean
# libunwind
RUN apt-get install -y --no-install-recommends  libunwind-17-dev && apt-get clean
# mlir
RUN apt-get install -y --no-install-recommends libmlir-17-dev mlir-17-tools && apt-get clean
# bolt - comment out - doesn't work on apple silicon
# RUN apt-get install -y --no-install-recommends libbolt-17-dev bolt-17 && apt-get clean
# flang
RUN apt-get install -y --no-install-recommends flang-17 && apt-get clean
# wasm support
RUN apt-get install -y --no-install-recommends libclang-rt-17-dev-wasm32 libclang-rt-17-dev-wasm64 libc++-17-dev-wasm32 libc++abi-17-dev-wasm32 libclang-rt-17-dev-wasm32 libclang-rt-17-dev-wasm64 && apt-get clean


RUN apt-get install -y time \
    && apt-get clean


ADD . /ece566
ADD . /build
WORKDIR /ece566

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd

RUN useradd -m user \
  && yes password | passwd user

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]
