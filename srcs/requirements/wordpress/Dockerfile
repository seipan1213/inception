FROM alpine:3.13

RUN apk update
RUN apk --no-cache add \
	curl \
	php php7-fpm php7-phar php-mbstring php-intl php7-openssl php7-json php7-mysqli php7-curl \
	mysql mysql-client

WORKDIR /
RUN curl https://ja.wordpress.org/wordpress-6.0-ja.tar.gz > /tmp/wordpress-ja.tar.gz\
	&& tar -xzf /tmp/wordpress-ja.tar.gz -C /var/www/ \
	&& rm -f /tmp/wordpress-ja.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /

COPY srcs/setup.sh /

RUN chmod 755 /setup.sh

ENTRYPOINT ["/setup.sh"]

EXPOSE 9000