FROM migrate/migrate

RUN apk -U --no-cache add bash

COPY ./migrations /app/migrations
COPY ./entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

WORKDIR /app
VOLUME [/app/migrations]

ENTRYPOINT ["/app/entrypoint.sh"]
