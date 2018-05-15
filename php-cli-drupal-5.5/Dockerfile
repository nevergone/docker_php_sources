FROM nevergone/php-cli:5.5-latest
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

RUN curl -L https://github.com/drush-ops/drush/releases/download/8.1.16/drush.phar -o /usr/local/bin/drush \
    && chmod +x /usr/local/bin/drush

VOLUME /app
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/shell"]
CMD ["/bin/bash"]
