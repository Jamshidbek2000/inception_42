FROM alpine:3.18

RUN apk add mysql mysql-client

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql

COPY tools/ /
RUN mv /my.cnf /usr/local/bin/

# EXPOSE 3306

ENTRYPOINT ["sh", "entrypoint.sh"]

# CMD ["tail", "-f", "/dev/null"]