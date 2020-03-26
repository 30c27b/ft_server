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

# Base image

FROM debian:buster

# System update

RUN apt-get -y update
RUN apt-get -y upgrade
