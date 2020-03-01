FROM debian:stable

LABEL maintainer="chevreux.matthieu@hotmail.com"

#install curl and gettext 
RUN apt-get update && \
    apt-get --no-install-recommends install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common gettext-base

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/` \
    curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
    