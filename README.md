# NGINX container

## Usage

* Start server: `./start_server`
* Stop server: `./stop_server`

## SSL configuration

* Option 1 self-signed: Just run `./start_server`
* Option 2 apply yours: Place certificates in `./cert/nginx/http.crt` & `./cert/nginx/http.key`

## htaccess

* Current user: admin
* Current password: test12345678

## Advanced

Adding include lines:

```shell
echo "$(awk '/# upstreams above/{print "include /etc/nginx/conf.d/extra-upstreams.nginx;"}1' default.conf)" > default.conf
echo "$(awk '/# locations above/{print "include /etc/nginx/conf.d/extra-locations.nginx;"}1' default.conf)" > default.conf
```
