# gitlab-runner

This project describes the gitlab runner that will execute our pipeline steps.
In this project's CI, the gitlab-runner is built and the other projecst' CI/CD will use it.

## Content of the runner image

The runner's base image is debian:stable-slim and the following packages are installed :

* apt-transport-https
* ca-certificates
* curl
* gnupg2
* software-properties-common
* gettext-base
* kubectl
* hasura-cli v1.1.1

## Build process

The image is built with docker:dind 19.03.1 in this project CI.

## Name convention

Basically the CI will build 2 types of images : testing and production images.
Testing images' names are based on the non tagged branches' names (e.g master, your-branch-name, etc...) while production images are named with the tags' names (e.g v1.0, v1.1, etc...).