# NGINX container

## Usage

* Start server: `./start_server`
* Stop server: `./stop_server`

## SSL configuration

* Option 1 self-signed: Just run `./start_server`
* Option 2 apply yours: Place certificates in `./cert/nginx/http.crt` & `./cert/nginx/http.key`

## Access

* Current user: admin
* Current password: test12345678

## Integrate with other services

* NGINX configuration level (jenkins example)

```shell
cp /opt/docker_jenkins/etc/nginx/conf.d/*.nginx /opt/docker_nginx/etc/nginx/conf.d/

echo "$(awk '/# upstream above/{print "include /etc/nginx/conf.d/jenkins-upstream.nginx;"}1' /opt/docker_nginx/etc/nginx/conf.d/default.conf)" > /opt/docker_nginx/etc/nginx/conf.d/default.conf
echo "$(awk '/# location above/{print "include /etc/nginx/conf.d/jenkins-location.nginx;"}1' /opt/docker_nginx/etc/nginx/conf.d/default.conf)" > /opt/docker_nginx/etc/nginx/conf.d/default.conf
```

* Docker Compose configuration level (jenkins example)

Edit `/opt/docker_nginx/docker-compose.yml` & add:

```yaml
...
networks:
  dockerjenkins_default:
    external: true
...
services:
  networks:
    - jenkinsdocker_default
```
