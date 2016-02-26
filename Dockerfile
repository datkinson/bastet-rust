FROM debian:latest
MAINTAINER Daniel Atkinson <hourd.tasa@gmail.com>
RUN apt-get update
RUN apt-get install -y \
  curl \
  file \
  sudo
RUN  curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=beta --yes
RUN mkdir -p /var/app
ADD ./ /var/app
WORKDIR /var/app
RUN cargo build
CMD cargo run
