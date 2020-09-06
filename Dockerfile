FROM node:alpine AS HASURA
ENV HASURA_VERSION 1.1.1
RUN npm install --save-dev hasura-cli@${HASURA_VERSION}

FROM debian:stable AS KUBECTL
ENV KUBECTL_VERSION v1.17.0
#install required packets
RUN apt-get update && \
    apt-get --no-install-recommends install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common gettext-base
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl

#final build
FROM debian:stable
LABEL maintainer="chevreux.matthieu@hotmail.com"
ENV ANSIBLE_VERSION 2.7.7+dfsg-1
# install kubectl
COPY --from=KUBECTL kubectl /usr/local/bin/kubectl
#install hasura cli and clear apt cache
COPY --from=HASURA /node_modules/hasura-cli/hasura /usr/local/bin/hasura
#installing ansible
RUN apt-get update && apt-get --no-install-recommends install -y gnupg2
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get --no-install-recommends install -y ansible=${ANSIBLE_VERSION} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*