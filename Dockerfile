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

