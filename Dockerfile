
FROM cimg/elixir:1.10.4-node

RUN sudo apt update -y
RUN sudo apt install -qq -y --no-install-recommends \
    inotify-tools \
    mysql-client \    
    libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb 

RUN curl https://sh.rustup.rs | sh -s -- -y && \
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $BASH_ENV

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /home/circleci/arvore