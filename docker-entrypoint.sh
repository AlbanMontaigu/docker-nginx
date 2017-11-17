#!/bin/bash
set -e

# Workaround to allow nginx to get dns name server from /etc/resolv.conf
# (this will allow nginx getting dynamically docker embedded dns ip or custom dns config)
# @see http://serverfault.com/questions/638822/nginx-resolver-address-from-etc-resolv-conf
echo "[INFO] -----------------------------------------------------------------------"
echo "[INFO] GENERATING resolv.conf FILE FOR NGINX with the following result:"
echo "[INFO] -----------------------------------------------------------------------"
echo resolver $(awk 'BEGIN{ORS=" "} $1=="nameserver" {print $2}' /etc/resolv.conf) ";" > /etc/nginx/conf.d/resolvers.conf
cat /etc/nginx/conf.d/resolvers.conf

#
# Checking witch configuration mode to follow
# TODO: can be dynamic thanks to docker-gen
# TODO: how to deal with custom user configuration ?
#
echo "[INFO] -----------------------------------------------------------------------"
echo "[INFO] Selecting appropriate NGINX_MODE"
echo "[INFO] -----------------------------------------------------------------------"
case "${NGINX_MODE}" in
    "php-fpm")
        echo "[INFO] Using default php-fpm configuration"
        rm /etc/nginx/sites-enabled/default.conf
        mv -f /etc/nginx/sites-disabled/default-php-fpm.conf /etc/nginx/sites-enabled/default-php-fpm.conf
        ;;
    "reverse-proxy")
        echo "[INFO] Using default reverse-proxy configuration"
        rm /etc/nginx/sites-enabled/default.conf
        mv -f /etc/nginx/sites-disabled/default-reverse-proxy.conf /etc/nginx/sites-enabled/default-reverse-proxy.conf
        sed -i -e "s|NGINX_BACKEND_URL|${NGINX_BACKEND_URL}|g" /etc/nginx/sites-enabled/default-reverse-proxy.conf
        ;;
    *) echo "[INFO] Using default configuration"
        ;;
esac


# Exec main command
exec "$@"

