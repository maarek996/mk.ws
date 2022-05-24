#!/bin/bash

DIR="/var/www/html/wordpress"
# init
# look for empty dira
if [ -d "$DIR" ]
then
	if [ "$(ls -A $DIR)" ]; then
     echo "Take action $DIR is not Empty"
	else
    echo "$DIR is Empty"
        unzip -qq latest.zip 
        rm -rf latest.zip   
        mv wp-config.php /var/www/html/wordpress/wp-config.php
	fi
else
	echo "Directory $DIR not found."
fi
exec "apache2-foreground"
