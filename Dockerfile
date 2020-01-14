FROM debian:stretch-20191224

LABEL maintainer="chevreux.matthieu@hotmail.com"

RUN apt-get update && apt-get -y install curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/` \
    curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl®
    