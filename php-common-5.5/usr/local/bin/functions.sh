#!/usr/bin/env bash

shopt -s nullglob

###
 # Check if current user is root
 ##
function rootCheck() {
    # Root check
    if [ "$(/usr/bin/whoami)" != "root" ]; then
        echo "[ERROR] $* must be run as root"
        exit 1
    fi
}

###
 # Create /docker.stdout and /docker.stderr
 ##
function createDockerStdoutStderr() {
    # link stdout from docker
    if [[ -n "$LOG_STDOUT" ]]; then
        echo "Log stdout redirected to $LOG_STDOUT"
    else
        LOG_STDOUT="/proc/$$/fd/1"
    fi

    if [[ -n "$LOG_STDERR" ]]; then
        echo "Log stderr redirected to $LOG_STDERR"
    else
        LOG_STDERR="/proc/$$/fd/2"
    fi

    ln -f -s "$LOG_STDOUT" /docker.stdout
    ln -f -s "$LOG_STDERR" /docker.stderr
}

###
 # Include script directory text inside a file
 #
 # $1 -> path
 ##
function includeScriptDir() {
    if [[ -d "$1" ]]; then
        for FILE in "$1"/*.sh; do
            echo "-> Executing ${FILE}"
            # run custom scripts, only once
            . "$FILE"
        done
    fi
}

###
 # List environment variables (based on prefix)
 ##
function envListVars() {
    if [[ $# -eq 1 ]]; then
        env | grep "^${1}" | cut -d= -f1
    else
        env | cut -d= -f1
    fi
}

###
 # Get environment variable (even with dots in name)
 #
 ##
function envGetValue() {
    awk "BEGIN {print ENVIRON[\"$1\"]}"
}
