# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ncoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/26 15:51:16 by ancoulon          #+#    #+#              #
#    Updated: 2020/03/26 15:52:16 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# *** BASE IMAGE QUERY ******************************************************* #

FROM debian:buster

# *** SYSTEM UPDATE ********************************************************** #

RUN apt-get -y update
RUN apt-get -y upgrade

# *** DEPENDENCIES INSTALLATION ********************************************** #

# nginx:
RUN apt-get install -y nginx

# mysql
RUN apt-get install -y mysql-server

# php:
RUN apt-get install -y php


# *** NGINX SETUP ************************************************************ #

# nginx config file replacement
RUN rm -v /etc/nginx/nginx.conf
ADD srcs/nginx.conf /etc/nginx/

# nginx service startup
CMD service nginx start

# *** GLOBAL SETUP *********************************************************** #

# port exposition
EXPOSE 80
