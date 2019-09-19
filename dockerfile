FROM node:11.15.0

ARG VERSION
ENV AWS_CLI_VERSION=$VERSION

RUN apt-get update && apt-get update

RUN apt-get -y install \
    python \
    python-pip \
    jq \
    bash \
    git \
    groff \
    less \
    bash \
    zip

RUN pip install --no-cache-dir awscli==$AWS_CLI_VERSION
RUN apt-get -y remove python-pip
RUN rm -rf /var/cache/apt/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]