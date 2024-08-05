FROM php:7.4-fpm
RUN apt-get update && \
    apt-get install -y \
    curl \
    supervisor \
    sudo \
    vim \
    nginx

WORKDIR /var/www/html
#COPY /php/default.conf /etc/nginx/conf.d/default.conf
COPY index.php /var/www/html/index.php
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY default.conf /etc/nginx/sites-enabled/default
CMD ["/usr/bin/supervisord"]
