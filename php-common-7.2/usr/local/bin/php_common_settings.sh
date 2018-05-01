#!/bin/bash
set -e

# load common functions
source /usr/local/bin/functions.sh

# enable debug mode
if [[ $ENABLE_DEBUG -eq 1 ]]; then
  phpenmod xdebug
fi

# enable uid/gid changing
if [[ -n $DEBUG_NEWUID ]]; then
  ORIG_UID=$(id -u www-data)
  ORIG_GID=$(id -g www-data)
  usermod -u $DEBUG_NEWUID www-data
  groupmod -g $DEBUG_NEWGID www-data
  find /var/run -user $ORIG_UID -exec chown -h $DEBUG_NEWUID {} \;
  find /var/run -group $ORIG_GID -exec chgrp -h $DEBUG_NEWGID {} \;
  usermod -g $DEBUG_NEWGID www-data &> /dev/null
fi
