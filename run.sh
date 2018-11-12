#!/bin/bash

#
# Reference: https://hub.docker.com/_/postgres/
#

# Place where Postgres data is stored at localhost
export PG_DATA="$HOME/.postgres_data"

# Postgres version
export PG_VERSION="11"

# Postgres user and password
export PG_USER="postgres"
export PG_PWD="123"


function print_usage () {
    echo "usage: $0 [ start | stop ]"
    echo ""
    echo "    start      Start postgres container"
    echo "    stop       Stop postgres container"
    echo ""
}

function start () {
    if [ ! -d "$PG_DATA" ]; then
        mkdir -p "$PG_DATA"
    fi

    docker-compose up -d
}

function stop () {
    docker-compose down
}

function main () {
    if [ -z ${1+x} ] || [[ ${1} = *"help"* ]]; then
        print_usage
        exit 1
    fi

    if [[ "$1" == "start" ]] || [[ "$1" == "stop" ]]; then
        $1
        return $?
    else
        print_usage
        exit 1
    fi
}

main "${@}"
