FROM debian:buster

RUN apt-get update && apt-get install -y \
  wget \
  curl \
  mariadb-server \
  php \
  php-fpm

COPY configs/docker-entrypoint.sh /root/docker-entrypoint.sh
COPY configs/wp-config.php /root/wp-config.php

WORKDIR "/root/"

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]



# FROM debian:buster

# # updating packages
# RUN apt-get update && apt-get install -y \
# 	php7.3 \
# 	php-fpm \
# 	php-cli \
# 	wget \
# 	curl \
# 	php-mysql \
# 	php-mbstring \
# 	php-xml \
# 	sendmail \
# 	mariadb-client \
# 	&& rm -rf /var/lib/apt/lists/* \
# 	&& mkdir /run/php

# RUN wget https://wordpress.org/wordpress-5.8.3.tar.gz \
# 	&& tar -xvzf wordpress-5.8.3.tar.gz \
# 	&& rm -rf wordpress-5.8.3.tar.gz


# COPY configs/docker-entrypoint.sh /usr/local/bin/
# COPY configs/wp-config.php /

# ENTRYPOINT [ "docker-entrypoint.sh" ]

# CMD [ "./usr/sbin/php-fpm7.3", "-F" ] 
