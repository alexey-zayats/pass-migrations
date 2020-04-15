# Миграции

Создать миграцию
```bash
$ ./migrate.sh create -dir ./migrations -ext sql migation-name
```

Запуск с использованием локального скрипта
```bash
$ ./migrate.sh up
```

Запуск migrate
```bash
$ migrate -path ./migrations -database mysql://pass:pass@tcp(localhost:3306)/pass?charset=utf8 up
```

Запуск из Docker-a
```bash
$ docker run -v ./migrations:/migrations --network host migrate/migrate
    -path=/migrations/ -database mysql://pass:pass@tcp(localhost:3306)/pass?charset=utf8 up 2
```
