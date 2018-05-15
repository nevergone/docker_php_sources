## install latest xdebug
FROM ubuntu:18.04 as xdebug
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	make \
        php-cli \
	php-dev \
    && git clone https://github.com/xdebug/xdebug.git -b xdebug_2_6 --depth 1 \
    && cd xdebug \
    && phpize \
    && ./configure --enable-xdebug \
    && make \
    && make test \
    && make install \
    && sed -i '1 i\zend_extension=xdebug.so' /xdebug/xdebug.ini \
    && sed -i '/;xdebug.remote_enable = 0/a xdebug.remote_enable = 1' /xdebug/xdebug.ini \
    && sed -i '/;xdebug.remote_connect_back = 0/a xdebug.remote_connect_back = 1' /xdebug/xdebug.ini

## create destination image
FROM ubuntu:18.04
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        php-bcmath \
        php-common \
        php-curl \
        php-gd \
        php-gmp \
        php-intl \
        php-json \
        php-mbstring \
        php-mysql \
        php-opcache \
        php-pgsql \
        php-readline \
        php-recode \
        php-sqlite3 \
        php-xml \
        php-zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=xdebug /usr/lib/php/20170718/xdebug.so /usr/lib/php/20170718/
COPY --from=xdebug /xdebug/xdebug.ini /etc/php/7.2/mods-available/
COPY usr /usr
