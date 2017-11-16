#!/bin/bash
set -e

# Workaround to allow nginx to get dns name server from /etc/resolv.conf
# (this will allow nginx getting dynamically docker embedded dns ip or custom dns config)
# @see http://serverfault.com/questions/638822/nginx-resolver-address-from-etc-resolv-conf
echo "[INFO] GENERATING resolv.conf FILE FOR NGINX with the following result:"
echo resolver $(awk 'BEGIN{ORS=" "} $1=="nameserver" {print $2}' /etc/resolv.conf) ";" > /etc/nginx/conf.d/resolvers.conf
cat /etc/nginx/conf.d/resolvers.conf

#
# Checking witch configuration mode to follow
# TODO: can be dynamic thanks to docker-gen
# TODO: how to dealy with custom user configuration ?
#
case "$1" in
    --php-fpm)
        echo "[INFO] Using default php-fpm configuration"
        mv /etc/nginx/sites-enabled/default.conf /etc/nginx/sites-disabled/default.conf
        mv /etc/nginx/sites-disabled/default-php-fpm.conf /etc/nginx/sites-enabled/default-php-fpm.conf
        ;;
    *) echo "[INFO] Using default configuration"
        ;;
esac

# Exec main command
exec "$@"
