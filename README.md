# Миграции

Создать миграцию
```bash
$ ./migrate.sh create -dir ./migrations -ext sql migation-name
```

Запуск в разработке
```bash
$ ./migrate.sh up
```

Установку и использование оригинального `migrate` смотрим тут
https://github.com/golang-migrate/migrate/tree/master/cmd/migrate


Накатить миграции
```bash
$ docker run --network host dockereg.athletic.cloud/pass-migrations -database 'mysql://pass:pass@tcp(192.168.1.36:3306)/pass?charset=utf8' up
-all
```

Откатить миграции
```bash
$ docker run --network host dockereg.athletic.cloud/pass-migrations -database 'mysql://pass:pass@tcp(192.168.1.36:3306)/pass?charset=utf8' down -all
```
