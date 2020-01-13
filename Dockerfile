FROM jc21/dpkg-ubuntu:bionic

MAINTAINER Jamie Curnow <jc@jc21.com>
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

USER root

RUN wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz -O /tmp/go.tgz \
  && cd /tmp \
  && tar -xzf go.tgz \
  && mv go /usr/local \
  && rm -f go.tgz

USER builder

ENV GOROOT=/usr/local/go
ENV GOPATH=/home/builder/go
ENV PATH="/usr/local/go/bin:/home/builder/go/bin:${PATH}"
