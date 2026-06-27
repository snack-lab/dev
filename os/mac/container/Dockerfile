# syntax=docker/dockerfile:1

ARG UBUNTU_VERSION=24.04
ARG NODE_VERSION=24.18.0

# node build stage
FROM node:${NODE_VERSION}-bookworm-slim AS node_build
WORKDIR /app
RUN --mount=type=cache,id=dev_node,target=/tmp/.npm \
      npm_config_cache=/tmp/.npm \
      npm i -g --no-audit --progress=false npm opencode-ai

# ubuntu build stage
FROM ubuntu:${UBUNTU_VERSION}

ENV container=container
ENV DEBIAN_FRONTEND=noninteractive

RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
      echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

RUN --mount=type=cache,id=dev_apt_cache,target=/var/cache/apt,sharing=locked \
      --mount=type=cache,id=dev_apt_lib,target=/var/lib/apt,sharing=locked \
      apt-get -qq update > /dev/null \
      && apt-get -qq install -y \
      dbus systemd openssh-server net-tools iproute2 iputils-ping curl wget man sudo language-pack-ja-base language-pack-ja locales tzdata git vim tmux mc > /dev/null \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# node
COPY --from=node_build --link /usr/local/bin/ /usr/local/bin/
COPY --from=node_build --link /usr/local/lib/node_modules /usr/local/lib/node_modules

# Locale setup
RUN locale-gen ja_JP.UTF-8 \
      && update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja LC_ALL=ja_JP.UTF-8

# timezone setup
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN >/etc/machine-id
RUN >/var/lib/dbus/machine-id

RUN systemctl set-default multi-user.target
RUN systemctl mask \
      dev-hugepages.mount \
      sys-fs-fuse-connections.mount \
      systemd-update-utmp.service \
      systemd-tmpfiles-setup.service \
      console-getty.service
RUN systemctl disable \
      networkd-dispatcher.service
