# ==========================================================================
#
# NGINX
#
# @see https://registry.hub.docker.com/_/nginx/
#
# ==========================================================================


# Base image
FROM nginx:latest


# Maintainer
MAINTAINER alban.montaigu@gmail.com


# Custom configuration
COPY ./conf/conf.d/proxy.conf /etc/nginx/conf.d/proxy.conf
COPY ./conf/sites-enabled /etc/nginx/sites-enabled
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
