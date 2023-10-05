# Use the Debian Linux base image with a specific version
FROM debian:buster

# Update package repository and install NGINX, OpenSSL, and other dependencies
RUN apt update && apt install -y nginx openssl && apt clean

# Create the SSL directory if it doesn't exist
RUN mkdir -p /etc/nginx/ssl/

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42/CN=jergashe.42.fr"

# copy config file and script to docker container
COPY configs/nginx.conf /etc/nginx/sites-available/
COPY configs/nginx-entrypoint.sh .

# give permission to execute the script (just in case)
RUN chmod +x nginx-entrypoint.sh

# this script will be first thing to run when container is started
# ENTRYPOINT [ "./nginx-entrypoint.sh" ]

# Start NGINX not in the background and to stay in the foreground
# CMD ["nginx", "-g", "daemon off;"]

CMD ["tail", "-f", "/dev/null"]
