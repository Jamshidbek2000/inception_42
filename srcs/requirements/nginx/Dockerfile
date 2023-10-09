# Use the Debian Linux base image with a specific version
FROM debian:buster

# Update package repository and install NGINX, OpenSSL, and other dependencies
RUN apt update && apt install -y nginx openssl  && apt clean && mkdir -p /etc/nginx/ssl/

# copy config file and script to docker container
COPY configs/nginx.conf /etc/nginx/
COPY configs/nginx-entrypoint.sh .

# give permission to execute the script (just in case)
RUN chmod +x nginx-entrypoint.sh


# this script will be first thing to run when container is started
ENTRYPOINT [ "./nginx-entrypoint.sh" ]

# Start NGINX not in the background and to stay in the foreground
CMD ["nginx", "-g", "daemon off;"]

# CMD ["tail", "-f", "/dev/null"]
