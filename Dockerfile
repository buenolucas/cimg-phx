
FROM cimg/elixir:1.10.4-node


# RUN sudo apt-get install -qq -y --no-install-recommends \
#     mysql-client \    
#     libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb \
#     && curl https://sh.rustup.rs | sh -s -- -y \
#     && echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

# FROM circleci/elixir:1.8.2-node

# #########
# # BASE
# #########
# ENV DEBIAN_FRONTEND=noninteractive
# RUN sudo apt-get update -qq 
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-exo", "pipefail", "-c"]
RUN sudo apt-update -y
RUN sudo apt-get install -qq -y --no-install-recommends \
    inotify-tools \
    mysql-client \    
    libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb 
#    && curl https://sh.rustup.rs | sh -s -- -y \
#    && echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
