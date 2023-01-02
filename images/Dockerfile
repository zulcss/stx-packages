ARG LUET_VERSION=0.33.0
ARG COSIGN_EXPERIMENTAL=0
ARG COSIGN_SKIP=".*quay.io/zulcss/.*"

FROM quay.io/luet/base:$LUET_VERSION as luet
FROM debian:testing

RUN apt-get update && \
    apt-get install -y ca-certificates

COPY --from=luet /usr/bin/luet /usr/bin/luet
RUN mkdir -p /etc/luet/repos.conf.d && \
    luet repo add stx-test -y --url http://localhost --type http
