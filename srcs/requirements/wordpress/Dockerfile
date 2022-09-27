FROM alpine:3.13

RUN apk update
RUN apk --no-cache add \
	curl \
	php php7-fpm php7-phar php-mbstring php-intl php7-openssl php7-json php7-mysqli php7-curl \
	mysql mysql-client

WORKDIR /

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY srcs/setup.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]

EXPOSE 9000