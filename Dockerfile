FROM circleci/elixir:1.8.2-node

#########
# BASE
#########
ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update -qq 

RUN sudo apt-get install -qq -y --no-install-recommends \
            mysql-client
