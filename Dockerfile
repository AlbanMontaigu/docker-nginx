# ==========================================================================
#
# NGINX
#
# @see https://registry.hub.docker.com/_/nginx/
# ==========================================================================

# Base image
FROM nginx:1.9.7

# Maintainer
MAINTAINER alban.montaigu@gmail.com

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Customization
RUN apt-get update \
    && apt-get -y upgrade \
    && mkdir -p /etc/nginx/sites-enabled \
    && rm -f /etc/nginx/conf.d/*.conf

# Custom nginx configuration files
COPY ./conf/conf.d/proxy.conf /etc/nginx/conf.d/proxy.conf
COPY ./conf/sites-enabled /etc/nginx/sites-enabled
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
