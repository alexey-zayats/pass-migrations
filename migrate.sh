#!/usr/bin/env bash

REALPATH=`realpath $0`
DIRPATH=`dirname $REALPATH`

MIGRATIONS=${MIGRATIONS:-$DIRPATH/migrations}
MIGRATE=${MIGRATE:-/usr/local/bin/migrate}

SQL_DRIVER=${SQL_DRIVER:-mysql}
SQL_USERNAME=${SQL_USERNAME:-pass}
SQL_PASSWORD=${SQL_PASSWORD:-pass}
SQL_HOSTNAME=${SQL_HOSTNAME:-localhost}
SQL_PORT=${SQL_PORT:-3306}
SQL_DATABASE=${SQL_DATABASE:-pass}

DSN=$(printf '%s://%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=true' "$SQL_DRIVER" "$SQL_USERNAME" "$SQL_PASSWORD" "$SQL_HOSTNAME" "$SQL_PORT" "$SQL_DATABASE" )

$MIGRATE -source=file://$MIGRATIONS -database $DSN $@
