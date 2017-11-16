#!/bin/bash
set -e

# Workaround to allow nginx to get dns name server from /etc/resolv.conf
# (this will allow nginx getting dynamically docker embedded dns ip or custom dns config)
# @see http://serverfault.com/questions/638822/nginx-resolver-address-from-etc-resolv-conf
echo "[INFO] ---------------------------------------------------------------"
echo "[INFO] GENERATING resolv.conf FILE FOR NGINX"
echo "[INFO] ---------------------------------------------------------------"
echo resolver $(awk 'BEGIN{ORS=" "} $1=="nameserver" {print $2}' /etc/resolv.conf) ";" > /etc/nginx/conf.d/resolvers.conf
echo "[INFO] $(cat /etc/nginx/conf.d/resolvers.conf)"

# Exec main command
exec "$@"
