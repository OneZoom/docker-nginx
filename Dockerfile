FROM onezoom/docker-base:18.04
MAINTAINER OneZoom developers <mail@onezoom.org>

ARG VCS_REF
ARG NGINX_VERSION
ARG DEBUG=false

LABEL description="Docker container for Nginx" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/onezoom/docker-nginx"

ENV NGINX_VERSION ${NGINX_VERSION}

RUN mkdir -p /build
COPY . /build

RUN chmod 755 /build/scripts/*.sh && /build/scripts/install.sh && /build/scripts/cleanup.sh

VOLUME ["/etc/nginx/conf.d", "/var/www/html", "/var/log/nginx"]

CMD ["/sbin/my_init"]

EXPOSE 80
