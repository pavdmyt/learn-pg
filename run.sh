#!/bin/bash

#
# Reference: https://hub.docker.com/_/postgres/
#

# Place where Postgres data is stored at localhost
PG_DATA="$HOME/.postgres_data"

# Postgres version
PG_VERSION="11"

# Postgres user and password
PG_USER="postgres"
PG_PWD="123"

# Container name
PG_CTNR_NAME="learn_postgres"


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

    docker run \
        --name "$PG_CTNR_NAME" \
        -v "${PG_DATA:-~/pg_data}:/var/lib/postgresql/data" \
        -e POSTGRES_PASSWORD="$PG_PWD" \
        -e POSTGRES_USER="$PG_USER" \
        -d postgres:${PG_VERSION:-11}-alpine
}

function stop () {
    docker stop "$PG_CTNR_NAME" && docker rm "$PG_CTNR_NAME"
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
