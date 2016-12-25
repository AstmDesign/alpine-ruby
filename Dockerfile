# vim:set ft=dockerfile:
FROM alpine:3.4

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk add --update --update-cache \
      --repository http://dl-4.alpinelinux.org/alpine/edge/main/ libressl libressl-dev ca-certificates \
&& apk add ruby ruby-bigdecimal ruby-bundler ruby-rdoc ruby-io-console ruby-irb \
      libstdc++ pcre libffi libxml2 libxslt zlib \
&& gem install foreman --no-rdoc --no-ri \
&& gem cleanup \
&& rm -rf /var/cache/apk/*

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1
RUN bundle config build.nokogiri --use-system-libraries

