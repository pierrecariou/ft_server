echo "ca fonctionne !!"
#nginx
/etc/init.d/mysql start
mariadb << MYSQL
CREATE DATABASE ft_server;
GRANT ALL ON ft_server.* TO 'pcariou'@'localhost' IDENTIFIED BY 'user42' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
MYSQL
mkdir /var/www/pcariou
chown -R $USER:$USER /var/www/pcariou.xyz
ln -s /etc/nginx/sites-available/pcariou.xyz /etc/nginx/sites-enabled/
/etc/init.d/nginx reload

nginx -g "daemon off;"
bash
