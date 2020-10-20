
FROM cimg/node:12.19-browsers

# Install Erlang via Erlang Solutions' .deb
ENV ERLANG_VERSION="22.3.4"
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    libodbc1 \
    libsctp1 \
    libncurses5  \
    libwxgtk3.0 && \
    erlangDEB="https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_${ERLANG_VERSION}-1~ubuntu~bionic_amd64.deb" && \
    curl -sSL -o erlang.deb $erlangDEB && \
    sudo dpkg -i erlang.deb && \
    sudo rm -rf erlang.deb /var/lib/apt/lists/*

# Install Elixir via Erlang Solutions' .deb
ENV ELIXIR_VERSION=1.10.4
RUN elixirDEB="https://packages.erlang-solutions.com/erlang/debian/pool/elixir_${ELIXIR_VERSION}-1~ubuntu~bionic_all.deb" && \
    curl -sSL -o elixir.deb $elixirDEB && \
    sudo dpkg -i elixir.deb && \
    rm -rf elixir.deb && \
    elixir --version

RUN sudo apt-get install -qq -y --no-install-recommends \
    mysql-client \    
    libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb \
    && curl https://sh.rustup.rs | sh -s -- -y \
    && echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

# FROM circleci/elixir:1.8.2-node

# #########
# # BASE
# #########
# ENV DEBIAN_FRONTEND=noninteractive
# RUN sudo apt-get update -qq 

# RUN sudo apt-get install -qq -y --no-install-recommends \
#     inotify-tools \
#     mysql-client \    
#     libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb \
#     && curl https://sh.rustup.rs | sh -s -- -y \
#     && echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
