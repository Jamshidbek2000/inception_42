FROM debian:buster

RUN apt update -y \
	&& apt install php-fpm php-mysql curl php-cgi default-mysql-client -y \
	&& apt clean

COPY ./configs/ /

RUN chmod +x /script.sh

# EXPOSE 9000

ENTRYPOINT [ "/script.sh" ]

# CMD ["tail", "-f", "/dev/null"]