#!/bin/bash
# удаляем  проброс, если вдруг это не первая инициализация
sed -i 's/^\(\s*-\s\)\.\/\(data:.*\)$/\1\2/g' docker-compose.yml
#постороение образа  из докер-файла
docker-compose up --build -d

#Создание и перенос распакованной wiki из образа в текущий каталог
mkdir ./data
docker cp $(docker ps | awk '/dokuwiki/{print$1}'):/var/www/html ./data
chown -R www-data:www-data ./data
docker-compose down

#редактируем docker-compose для проброса локального каталога в докер
sed -i 's/^\(\s*-\s\)\(data:.*\)$/\1\.\/\2/g' docker-compose.yml

docker-compose up -d
