## install latest xdebug
FROM ubuntu:14.04 as xdebug
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	make \
	php5-cli \
	php5-dev \
    && git clone https://github.com/xdebug/xdebug.git -b xdebug_2_5 --depth 1 \
    && cd xdebug \
    && ./rebuild.sh \
    && sed -i '1 i\zend_extension=xdebug.so' /xdebug/xdebug.ini \
    && sed -i '/;xdebug.remote_enable = 0/a xdebug.remote_enable = 1' /xdebug/xdebug.ini \
    && sed -i '/;xdebug.remote_connect_back = 0/a xdebug.remote_connect_back = 1' /xdebug/xdebug.ini

## create destination image
FROM ubuntu:14.04
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        php5-common \
        php5-curl \
        php5-gd \
        php5-gmp \
        php5-intl \
        php5-json \
        php5-mcrypt \
        php5-mysql \
        php5-pgsql \
        php5-readline \
        php5-recode \
        php5-sqlite \
    && rm -rf /var/lib/apt/lists/*

COPY --from=xdebug /usr/lib/php5/20121212/xdebug.so /usr/lib/php5/20121212/
COPY --from=xdebug /xdebug/xdebug.ini /etc/php5/mods-available/
COPY usr /usr
