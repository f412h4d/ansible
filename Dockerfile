FROM --platform=linux/amd64 archlinux:latest AS base
WORKDIR /usr/local/bin

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel curl git ansible && \
    pacman -Scc --noconfirm

FROM base AS f412h4d
ARG TAGS

RUN groupadd -g 1000 th3g3ntl3man && \
    useradd -m -u 1000 -g 1000 -s /bin/bash th3g3ntl3man

USER th3g3ntl3man
WORKDIR /home/th3g3ntl3man

FROM f412h4d
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
