FROM circleci/elixir:1.8.2-node

#########
# BASE
#########
ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update -qq 

RUN sudo apt-get install -qq -y --no-install-recommends \
            inotify-tools \
            mysql-client \
            net-tools \
            libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
            

CMD ["mix", "phx.server"]
