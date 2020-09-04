FROM debian:buster
MAINTAINER pierrecariou <pierrecariou@outlook.fr>
RUN apt update
RUN apt install -y vim

#build LEMP stack

RUN apt install nginx -y
#RUN nginx
RUN apt install mariadb-server mariadb-client -y
RUN /etc/init.d/mysql start
RUN apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl -y
#RUN service nginx restart
RUN echo "<?php phpinfo( ); ?>" > /var/www/html/phpinfo.php
ADD srcs/default /etc/nginx/sites-available/
RUN /etc/init.d/php7.3-fpm start
#RUN service nginx restart

#launch script to run

ADD srcs/script.sh /usr/bin/script.sh
CMD ["bash", "script.sh"]

#sudo docker build -t imgbuster .
#sudo docker run --rm -ti -p 80:80 imgbuster
