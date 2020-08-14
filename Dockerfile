# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/26 15:51:16 by ancoulon          #+#    #+#              #
#    Updated: 2020/03/26 15:52:16 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# *** BASE IMAGE QUERY ******************************************************* #

FROM debian:buster


# *** METADATA *************************************************************** #

LABEL maintainer="ancoulon@student.s19.be"


# *** SYSTEM UPDATE ********************************************************** #

RUN apt-get update -y
RUN apt-get upgrade -y


# *** DEPENDENCIES INSTALLATION ********************************************** #

# nginx:
RUN apt-get install -y nginx

# mysql
RUN apt-get install -y mariadb-server

# php:
RUN apt-get install -y php7.3-fpm php7.3-mysql \
php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline

# *** NGINX SETUP ************************************************************ #

ADD srcs/wordpress.conf /etc/nginx/sites-available/wordpress.conf
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/


# *** WEBSERVERS SETUP ******************************************************* #

# wordpress
ADD srcs/wordpress /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# # phpmyadmin
# ADD srcs/phpmyadmin /var/www/phpmyadmin
# RUN chown -R www-data:www-data /var/www/phpmyadmin

# *** SERVICES *************************************************************** #

# nginx
RUN service nginx start

# mysql
RUN service mysql start

# php
RUN service php7.3-fpm start


# *** GLOBAL SETUP *********************************************************** #

# port exposition
EXPOSE 80

# adding initialisation script
ADD srcs/init.sh init.sh

# running init script
CMD /bin/bash init.sh
