# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/26 15:51:16 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/14 09:39:07 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL maintainer="ancoulon@student.s19.be"

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server
RUN apt-get install -y php7.3-fpm php7.3-mysql \
php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline

ADD srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm -f /etc/nginx/sites-enabled/default

ADD srcs/wordpress.sql /root/wp/wordpress.sql
RUN service mysql start && \
	mysql -u root < /root/wp/wordpress.sql

ADD srcs/wordpress /var/www/localhost/wordpress
RUN chown -R www-data:www-data /var/www/localhost/wordpress

ADD srcs/phpmyadmin /var/www/localhost/phpmyadmin
RUN chown -R www-data:www-data /var/www/localhost/phpmyadmin

ADD srcs/mkcert mkcert
RUN chmod +x ./mkcert && \
	./mkcert -install && \
	./mkcert localhost

EXPOSE 80
EXPOSE 443

ADD srcs/init.sh /root/init.sh
CMD ["/bin/bash", "/root/init.sh"]
