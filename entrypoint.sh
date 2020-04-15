#!/usr/bin/env bash

echo $@

exec /usr/local/bin/migrate -path /app/migrations "$@"
