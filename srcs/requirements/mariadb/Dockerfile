FROM alpine:latest

RUN apk add mysql mysql-client

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql

COPY tools/ /
RUN mv /my.cnf /usr/local/bin/

ENTRYPOINT ["sh", "entrypoint.sh"]

# CMD ["tail", "-f", "/dev/null"]