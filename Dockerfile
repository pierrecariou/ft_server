FROM debian:buster
MAINTAINER pierrecariou <pierrecariou@outlook.fr>
RUN apt update
RUN apt install -y vim


#build LEMP stack

RUN apt install nginx -y
RUN apt install mariadb-server mariadb-client -y
RUN apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl -y
RUN echo "<?php phpinfo( ); ?>" > /var/www/html/phpinfo.php
ADD srcs/default /etc/nginx/sites-available/


#build wordpress

RUN apt install wget -y
RUN apt install zip -y
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip -d /var/www/html/
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN mv /var/www/html/wordpress/* /var/www/html/
RUN rm -rf /var/html/wordpress
ADD srcs/wp-config.php /var/www/html/


#build phpmyadmin

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN mkdir /var/www/html/phpmyadmin
RUN tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
RUN cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
RUN chmod 660 /var/www/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/html/phpmyadmin


#launch script to run

ADD srcs/script.sh /usr/bin/script.sh
CMD ["bash", "script.sh"]

#sudo docker build -t imgbuster .
#sudo docker run --rm -ti -p 80:80 imgbuster
