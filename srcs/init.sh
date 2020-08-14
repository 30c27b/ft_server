service mysql restart

mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_pass';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

service php7.3-fpm restart

nginx -g 'daemon off;'