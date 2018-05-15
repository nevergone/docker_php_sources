FROM nevergone/php-common:7.2-latest
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        libapache2-mod-php \
        ssl-cert \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/lock/apache2 /var/run/apache2 \
    && a2enmod ssl rewrite \
    && a2ensite default-ssl \
    && echo '## Docker healtcheck\nIncludeOptional /etc/apache2/docker-healtcheck-test/*.conf' >> /etc/apache2/apache2.conf
COPY usr /usr
COPY etc /etc

HEALTHCHECK --interval=10s --timeout=3s CMD /usr/local/bin/healthcheck
VOLUME /var/www
WORKDIR /var/www
EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/apache2-foreground"]
