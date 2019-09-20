FROM gcc as gcc
ENV SEMVER_VERSION=2.1.0
RUN wget -O /tmp/semver.tgz https://github.com/fsaintjacques/semver-tool/archive/${SEMVER_VERSION}.tar.gz && \
    tar xvf /tmp/semver.tgz -C /tmp && \
    cd /tmp/semver-tool-${SEMVER_VERSION} && \
    make install && \
    rm -rf /tmp/semver*

FROM alpine:latest
RUN apk add --no-cache bash
WORKDIR /
COPY --from=gcc /usr/local/bin/semver /usr/local/bin/semver
