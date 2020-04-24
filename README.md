# Миграции

Установку и использование оригинального `migrate` смотрим тут
https://github.com/golang-migrate/migrate/tree/master/cmd/migrate

Создать миграцию
```bash
$ ./migrate.sh create -dir ./migrations -ext sql migation-name
```

Запуск в разработке
```bash
$ ./migrate.sh up
```

Накатить миграции
```bash
$ docker run --network host aazayats/claim-migrations -database 'mysql://pass:pass@tcp(192.168.1.36:3306)/pass?charset=utf8' up
```

Откатить миграции
```bash
$ docker run --network host aazayats/claim-migrations -database 'mysql://pass:pass@tcp(192.168.1.36:3306)/pass?charset=utf8' down -all
```
