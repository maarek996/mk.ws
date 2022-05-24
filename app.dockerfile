FROM php:apache

RUN apt-get update && a2enmod rewrite 

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get install apt-utils -y && apt-get install wget -y && apt-get install tar -y
RUN cd ~ && wget https://wordpress.org/latest.tar.gz && tar zxvf latest.tar.gz && mv wordpress/* /var/www/html
RUN rm -rf latest.tar.gz && rm -rf wordpress

RUN docker-php-ext-install mysqli
COPY ./wp-config.php /var/www/html
RUN service apache2 restart
