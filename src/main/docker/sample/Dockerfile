FROM mysql:5.7

LABEL Author="Alex Panov", version=0.1

# Поднимаем консоль в контейнере
# ENTRYPOINT service mysql start && /bin/sh

# объединили несколько команд в одном слое. Если mysql стартуем в секции ENTRYPOINT, здесь это уже не нужно
# Эти команды не нужны, если мы юзаем группу команд [A]
#RUN # service mysql start && \
# mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE sandbox" && \
# mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'sandboxuser'@'%' identified by 'sandboxpass';" && \
# mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON sandbox.* TO 'sandboxuser'@'%' IDENTIFIED BY 'sandboxpass'; FLUSH PRIVILEGES"

# порт 3306 уже открыт в базовом образе mysql

# Можно указать пароль в скрипте сборки (ниже), а можно позволить пользователю указать пароль самому при сборке (в командной строке?)
# ENV MYSQL_ROOT_PASSWORD=root

# позволяет указать логин/пароль пользователя, которые будут созданы при старте контейнера и которым будут даны полномочия SUPERUSER по доступу к созданной базе
# ENV MYSQL_USER=sandboxuser
# ENV MYSQL_PASSWORD=sandboxpass

# Задать базу данных, которая будет создана при первом старте контейнера через перерменную окружения mysql
# ENV MYSQL_DATABASE=sandbox

# Либо так [A]:
ENV MYSQL_ROOT_PASSWORD=root \
       MYSQL_USER=sandboxuser \
       MYSQL_PASSWORD=sandboxpass \
       MYSQL_DATABASE=sandbox

# Скопировать grant.sql в папку /docker-entrypoint-initdb.sh
ADD grant.sql /docker-entrypoint-initdb.sh/

# cd src/main/docker/sample
# Команда сборки образа (сначала перейти в папку, где лежит Dockerfile): docker build -t babagay/mysql .

# Команда запуска собранного контейнера:
# docker run -i -t -p 3306:3306 babagay/mysql
# или так: docker run -it babagay/mysql

# Вариант команды запуска контейнера с указанием его имени и пароля mysql, а также с маппингом портов
# docker run -it -e MYSQL_ROOT_PASSWORD=secret_pw -p 3307:3306 --name=mysql_sandbox babagay/mysql
# docker run -it -e MYSQL_ROOT_PASSWORD=secret_pw -p 3307:3306 --name=mysql_sandbox --memory=256M --cpus=1 babagay/mysql
# docker run -it -e MYSQL_ROOT_PASSWORD=secret_pw -p 3307:3306 --name=mysql_sandbox --memory=256M --cpus=1 -v d:/data:/var/lib/mysql babagay/mysql
# 3307 - это порт, на который надо стучатсья с локальной машины. А 3306 - порт внутри контейнера
# Команда входа в запущенный контейнер через консоль:
# docker exec -it mysql_sandbox /bin/sh
# лимит памяти для контейнера 256М и одно ядро
# Ключ -v позволяет подмонтировать локальную папку к папке внутри образа
# docker rm -f mysql_sandbox - удалить контейнер mysql_sandbox
# docker ps -a - список контейнеров





# Команда, чтоб посмотреть историю создания образа: docker history --no-trunc mysql

# docker stop mysql_sandbox

# docker start mysql_sandbox

# [issues]
# Файл grant.sql скопировался, но, видимо, не отработал, т.к. тестовая таблица не появилась
