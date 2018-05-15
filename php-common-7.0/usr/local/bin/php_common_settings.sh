#!/bin/bash
set -e

# load common functions
source /usr/local/bin/functions.sh

# enable debug mode
if [[ $ENABLE_DEBUG -eq 1 ]]; then
  phpenmod xdebug
fi

# enable uid/gid changing for unprivileged user
if [[ -n $UNPRIV_UID ]]; then
  ORIG_UID=$(id -u www-data)
  ORIG_GID=$(id -g www-data)
  usermod -u $UNPRIV_UID www-data
  groupmod -g $UNPRIV_GID www-data
  find /var/run -user $ORIG_UID -exec chown -h $UNPRIV_UID {} \;
  find /var/run -group $ORIG_GID -exec chgrp -h $UNPRIV_GID {} \;
  usermod -g $UNPRIV_GID www-data &> /dev/null
fi
