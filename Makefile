.DEFAULT_GOAL := up
include private.mk

docker_compose_version ?= 1.22.0
CHECK ?= ./certs/nginx/https.key
USER ?= admin
PASSWORD ?= admin@123
CNAME ?= dockernginx_nginx_1

requirements:
	-apt-get update
	-apt-get -y install make curl docker.io apache2-utils
	-curl \
	  -L "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" \
	  -o /usr/local/bin/docker-compose
	-chmod +x /usr/local/bin/docker-compose

install: requirements generate_keys

up:
	if [ -e "${CHECK}" ] ; \
	then docker-compose up -d ; \
	else ./bin/create_keys && docker-compose up -d ; \
	fi

down:
	docker-compose down

restart: down up

generate_keys:
	-./bin/create_keys

htuser:
	htpasswd -cb ./etc/nginx/.htpasswd ${USER} ${PASSWORD}

logs:
	docker-compose logs -f

in:
	docker exec -it ${CNAME} bash
