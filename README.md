# docker-nginx

## Introduction

This image aims to be my personal nginx front server but you can use it if you want.

Mainly it is configured by default to act as a **proxy server** and espacially (but no exclusive) for php applications when linked with a container from [nginx-php](https://hub.docker.com/r/amontaigu/nginx-php/).

## References and documentation

* [Nginx configuration](http://wiki.nginx.org/FullExample)
* [Reverse proxy configuration](http://doc.ubuntu-fr.org/tutoriel/reverse_proxy_nginx)
* [Official nginx image source](https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile)
* [Some ngninx php image](https://github.com/ngineered/nginx-php-fpm)
* [Some configuration reference to improve performance](http://tweaked.io/guide/nginx/)

## Getting the source

On GitHub with my [docker-nginx](https://github.com/AlbanMontaigu/docker-nginx).

## You could be interested by

My [nginx-php](https://hub.docker.com/r/amontaigu/nginx-php/) docker image and it's [source](https://github.com/AlbanMontaigu/docker-nginx-php) on GitHub.

Then you can have a nginx proxy with a php-fpm middle to play with your PHP applications.
