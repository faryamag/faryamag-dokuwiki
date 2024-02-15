FROM php:7-apache-bullseye
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
WORKDIR /var/www/html
ADD https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz /var/www/html/
RUN  tar -xzvf dokuwiki-stable.tgz --strip-components=1 -C /var/www/html/ \
        && chown -R www-data:www-data /var/www/html \
        && rm dokuwiki-stable.tgz
