# README

API для получения погоды

Используемые технологии:

* Ruby

* Docker-compose

* PostgreSQL

* Grape

* Swagger

```
docker-compose up
```
Запуск сессии внутри контейнера:
```
docker-compose run --rm --service-ports web /bin/bash
```
Внутри контейнера установить гемы:
```
bundle
```
Внутри контейнера создать базу данных, прогнать миграции, добавить тестовые данные:

```
rails db:create
rails db:migrate
rails db:seed
```
* Проверить методы можно на http://localhost:3000/swagger
