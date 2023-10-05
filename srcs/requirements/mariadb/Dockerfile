FROM debian:buster

RUN apt update && apt install -y mariadb-server

COPY configs/mariadb-entrypoint.sh /
RUN chmod +x mariadb-entrypoint.sh

ENTRYPOINT ["./mariadb-entrypoint.sh"]

CMD ["tail", "-f", "/dev/null"]
