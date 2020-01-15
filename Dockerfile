FROM debian:stable

LABEL maintainer="chevreux.matthieu@hotmail.com"

#install docker
RUN apt-get update && \
    apt-get --no-install-recommends install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" && \
    apt-get update && apt-get --no-install-recommends install -y docker-ce docker-ce-cli containerd.io

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/` \
    curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
    