#!/bin/bash
set -e

# Who and where am I ?
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] GLOBAL INFORMATIONS"
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] whoami : $(whoami)"
echo >&2 "[INFO] pwd : $(pwd)"

# Workaround to allow nginx to get dns name server from /etc/resolv.conf
# (this will allow nginx getting dynamically docker embedded dns ip or custom dns config)
# @see http://serverfault.com/questions/638822/nginx-resolver-address-from-etc-resolv-conf
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] GENERATING resolv.conf FILE FOR NGINX"
echo >&2 "[INFO] ---------------------------------------------------------------"
echo resolver $(awk 'BEGIN{ORS=" "} $1=="nameserver" {print $2}' /etc/resolv.conf) ";" > /etc/nginx/conf.d/resolvers.conf

# Displaying resolvers.conf
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] DISPLAYING resolv.conf FILE FOR NGINX"
echo >&2 "[INFO] ---------------------------------------------------------------"
cat /etc/nginx/conf.d/resolvers.conf

# Exec main command
exec "$@"
