FROM debian:buster
MAINTAINER pierrecariou <pierrecariou@outlook.fr>
RUN apt update
RUN apt install -y vim
RUN apt install -y nginx
RUN apt install -y mariadb-server
RUN apt install -y php-fpm php-mysql

#RUN apt install -y php-fpm php-opcache php-cli php-gd php-curl php-mysql
#RUN apt install -y php php-fpm php-mysql
#RUN apt install -y phpmyadmin
ADD srcs/script.sh /usr/bin/script.sh
#RUN chmod 755 /usr/bin/script.sh
#RUN mkdir -p /var/www/p.cariou
#RUN chown -R $USER:$USER /var/www/p.cariou
#RUN ln -s /etc/nginx/sites-available/p.cariou /etc/nginx/sites-enabled/
ADD srcs/pcariou.xyz /etc/nginx/sites-available
#ADD srcs/info.php /var/www/super
#EXPOSE 80
CMD ["bash", "script.sh"]
#CMD ["nginx", "-g", "daemon off;"]
#CMD ["bash"]

#sudo docker build -t imgbuster .
#sudo docker run --rm -ti -p 8080:80 imgbuster
