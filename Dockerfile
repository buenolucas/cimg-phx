FROM circleci/elixir:1.8.2-node

ENV LANG C.UTF-8
ENV LANGUAGE C:en
ENV LC_ALL C

#########
# BASE
#########
ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update -qq 

RUN sudo apt-get install -qq -y --no-install-recommends \
            mysql-client

ENV RUST_VERSION=1.43.1 \
	PATH=/home/circleci/.cargo/bin:$PATH

RUN curl -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init && \
	chmod +x rustup-init && \
	./rustup-init -y --no-modify-path --default-toolchain $RUST_VERSION && \
	rm rustup-init && \
	rustc --version && \
	cargo --version

RUN rustup component add rustfmt
