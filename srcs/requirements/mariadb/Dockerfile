FROM alpine:3.13

RUN apk update
RUN apk --no-cache add \
    mysql \
    mysql-client

RUN touch /var/log/mysqld.log

COPY srcs/setup.sh /
#COPY srcs/my.cnf /etc/mysql/

RUN chmod 755 /setup.sh
RUN chmod 666 /var/log/mysqld.log

ENTRYPOINT ["/setup.sh"]