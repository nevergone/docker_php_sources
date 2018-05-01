FROM nevergone/php-cli:7.2.3-1ubuntu1
LABEL maintainer="Kurucz István <never@nevergone.hu>"
LABEL vendor="nevergone"

RUN curl -L https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar -o /usr/local/bin/drush \
    && chmod +x /usr/local/bin/drush \
    && curl -L https://drupalconsole.com/installer -o /usr/local/bin/drupal \
    && chmod +x /usr/local/bin/drupal

VOLUME /app
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/shell"]
CMD ["/bin/bash"]
