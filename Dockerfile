# -*- mode: dockerfile -*-
#
# A multi-stage Dockerfile that builds a Linux target then creates a small
# final image for deployment.

#
# STAGE 1
#
# Uses a Go image to build a release binary.
#
FROM golang:1.11-alpine AS builder
ARG tag=latest
ENV DOCKER_TAG=$tag
ENV GO111MODULE=on

RUN apk --no-cache add git make gcc g++
WORKDIR /go/src/github.com/alpacahq/marketstore/
ADD ./ ./
RUN make vendor
RUN make install plugins

#
# STAGE 2
#
# Use a tiny base image (alpine) and copy in the release target. This produces
# a very small output image for deployment.
#
FROM alpine:latest
RUN apk --no-cache add ca-certificates tzdata bash dnsmasq
WORKDIR /
COPY --from=builder /go/bin/marketstore /bin/
COPY --from=builder /go/bin/*.so /bin/

# configure dnsmasq - everything to google, but api.binance.com to proxy
RUN echo 'listen-address=127.0.0.1' >> /etc/dnsmasq.conf \
	&& echo 'resolv-file=/etc/resolv.dnsmasq.conf' >> /etc/dnsmasq.conf \
	&& echo 'conf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf \
	&& echo 'user=root' >> /etc/dnsmasq.conf


RUN ["marketstore", "init"]
RUN mv mkts.yml /etc/
VOLUME /data
EXPOSE 5993

COPY run.sh /
RUN chmod 755 /run.sh

COPY resolv.conf /etc/

CMD ["/run.sh"]
