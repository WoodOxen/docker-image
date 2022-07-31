FROM centos:7

RUN \
    yum install -y curl gcc make git openssh openssl-devel &&\
    yum clean all && rm -rf /var/cache/yum
ENV RUSTUP_HOME=/opt/rust CARGO_HOME=/opt/rust 
ENV PATH=/opt/rust/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN \
    export RUSTUP_HOME;export CARGO_HOME &&\
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y &&\
    rustc --version &&\
    rustup target add x86_64-unknown-linux-musl

RUN echo -e '\
[source]                                                                    \n\
                                                                            \n\
[source.tuna]                                                               \n\
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"   \n\
                                                                            \n\
[source.crates-io]                                                          \n\
replace-with = "tuna"                                                  \
' > /opt/rust/config.toml
