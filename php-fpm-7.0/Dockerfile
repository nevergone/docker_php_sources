FROM nevergone/php-common:7.0-latest
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libfcgi0ldbl \
        php-fpm \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /run/php \
    && sed -i '/listen = \/run\/php\/php7.0-fpm.sock/a listen = 9000' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/;pm.status_path = \/status/a pm.status_path = \/status' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/;access.log = log\/$pool.access.log/a access.log = \/var\/log\/$pool.access.log' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/;slowlog = log\/$pool.log.slow/a slowlog = \/var\/log/$pool.log.slow' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/;request_slowlog_timeout = 0/a request_slowlog_timeout = 10' /etc/php/7.0/fpm/pool.d/www.conf
COPY usr /usr

HEALTHCHECK --interval=10s --timeout=3s CMD /usr/local/bin/healthcheck
EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/php_fpm-foreground"]
