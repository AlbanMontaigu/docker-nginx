# ==========================================================================
#
# NGINX
#
# @see https://registry.hub.docker.com/_/nginx/
# ==========================================================================

# Base image
FROM nginx:1.13.6-alpine

# Maintainer
LABEL maintainer="alban.montaigu@gmail.com"

# Environment configuration
ENV NGINX_MODE="php-fpm" \
    NGINX_BACKEND_URL="_NA_"

# ensure www-data user exists for php compatibility
RUN set -x && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -D -S -G www-data www-data && \
# 82 is the standard uid/gid for "www-data" in Alpine
# http://git.alpinelinux.org/cgit/aports/tree/main/apache2/apache2.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/lighttpd/lighttpd.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/nginx-initscripts/nginx-initscripts.pre-install?h=v3.3.2

# Customization
    mkdir -p /etc/nginx/sites-enabled && \
    rm -f /etc/nginx/conf.d/*.conf

# Custom nginx configuration files
COPY ./conf/conf.d/*.conf /etc/nginx/conf.d/
COPY ./conf/conf.d-disabled /etc/nginx/conf.d-disabled
COPY ./conf/sites-enabled/*.conf /etc/nginx/sites-enabled/
COPY ./conf/sites-disabled /etc/nginx/sites-disabled
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Entrypoint to enable live customization
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Volumes to share
VOLUME ["/var/www", "/var/log/nginx", "/var/run/php"]
WORKDIR /var/www

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

