echo "ca fonctionne !!"

nginx
/etc/init.d/mysql start

mariadb << MYSQL
CREATE DATABASE ft_server;
GRANT ALL ON ft_server.* TO 'pcariou'@'localhost' IDENTIFIED BY 'user42' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
MYSQL

/etc/init.d/php7.3-fpm start
bash
