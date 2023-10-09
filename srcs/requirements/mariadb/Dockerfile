FROM debian:buster


RUN apt-get update -y && apt-get install mariadb-server -y


EXPOSE 3306


COPY configs/mariadb-entrypoint.sh /
COPY configs/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x mariadb-entrypoint.sh

# ENTRYPOINT ["./mariadb-entrypoint.sh"]

# CMD "./mariadb-entrypoint.sh"

CMD ["tail", "-f", "/dev/null"]
