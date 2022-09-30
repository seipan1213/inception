FROM alpine:3.13

RUN apk update
RUN apk --no-cache add \
	nginx \
	openssl

WORKDIR /etc/ssl

RUN	openssl genrsa 2048 > ./private/server.key \
	&& openssl req -new -key ./private/server.key > ./certs/server.csr \
	-subj '/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=42Tokyo/CN=example.com'\
	&& openssl x509 -days 3650 -req -signkey ./private/server.key < ./certs/server.csr > ./certs/server.crt

WORKDIR /

COPY srcs/nginx.conf etc/nginx/
COPY srcs/wp.conf etc/nginx/conf.d/

COPY srcs/setup.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]

EXPOSE 443