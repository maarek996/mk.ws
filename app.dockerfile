FROM php:apache

RUN apt-get update && a2enmod rewrite 

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get install apt-utils -y && apt-get install wget -y && apt install zip -y
RUN wget https://wordpress.org/latest.zip

RUN docker-php-ext-install mysqli

COPY wp-config.php /var/www/html/wp-config.php
COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]


