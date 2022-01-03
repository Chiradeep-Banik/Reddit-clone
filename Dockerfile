FROM debian:stable-slim

RUN apt update && apt full-upgrade

RUN apt install curl -y && curl -fsSL https://deb.nodesource.com/setup_17.x | bash -

RUN apt remove -y curl && apt autoremove -y

RUN apt-get install -y nodejs

RUN apt install git -y

RUN apt install wget && sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p docker

RUN apt remove -y wget && apt autoremove -y

RUN mkdir app

WORKDIR /app

RUN cd ~ && echo exec zsh >> .bashrc
