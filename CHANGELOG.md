
## 1.13.6 (2017-11-20)
- Update to nginx 1.13.6 **alpine** version
- Update deprecated MAINTAINER tag to LABEL
- CircleCI added
- Messages from entrypoint.sh changed
- Volumes definition added
- Ensure www-data user exists and is used for php compatibility
- Other configuration and site samples included
- `NGINX_MODE` option added
- Now php fpm sock is in a volume to allow share with php fpm backend in a sock mode
- Now php-fpm mode by default instead of reverse proxy
- Proxy cache disabled by default

## 1.13.0 (2017-05-09)
- Update to nginx 1.13.0

## 1.11.8 (2017-01-02)
- Update to nginx 1.11.8
- Now use of base image with no upgrade (bad for layers reuse and stability)

## 1.11.5 (2016-10-15)
- Update to nginx 1.11.5

## 1.11.3 (2016-09-03)
- Update to nginx 1.11.3
