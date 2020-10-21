
FROM cimg/elixir:1.10.4-node

RUN sudo apt update -y
RUN sudo apt install -qq -y --no-install-recommends \
    inotify-tools \
    mysql-client \    
    libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb 

ENV RUST_VERSION=1.46.0 \
    PATH=/home/circleci/.cargo/bin:$PATH
RUN curl -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init && \
    chmod +x rustup-init && \
    ./rustup-init -y --no-modify-path --default-toolchain $RUST_VERSION && \
    rm rustup-init && \
    rustc --version && \
    cargo --version

RUN rustup component add rustfmt

RUN mix local.hex --force && \
    mix local.rebar --force
