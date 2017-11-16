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

# Customization
RUN mkdir -p /etc/nginx/sites-enabled \
    && rm -f /etc/nginx/conf.d/*.conf

# Custom nginx configuration files
COPY ./conf/conf.d/proxy.conf /etc/nginx/conf.d/proxy.conf
COPY ./conf/sites-enabled /etc/nginx/sites-enabled
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Entrypoint to enable live customization
COPY docker-entrypoint.sh /docker-entrypoint.sh

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
