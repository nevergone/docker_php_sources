FROM nevergone/php-common:5.5-latest
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        mysql-client \
        openssh-client \
        patch \
        php5-cli \
        postgresql-client \
        sqlite3 \
    && mkdir /home/www-data \
    && chown www-data:www-data /home/www-data \
    && usermod -d /home/www-data --shell /bin/bash www-data
    COPY usr /usr
    ## install composer
    COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

VOLUME /app
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/shell"]
CMD ["/bin/bash"]
