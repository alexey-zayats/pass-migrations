#!/usr/bin/env bash

exec /usr/local/bin/migrate -path /app/migrations "$@"
