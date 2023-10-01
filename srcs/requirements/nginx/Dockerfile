# Use the Alpine Linux base image with a specific version
FROM alpine:3.14

# Update package repository and install NGINX, OpenSSL, and other dependencies
RUN apk --no-cache update && \
    apk --no-cache add nginx openssl && \
    rm -rf /var/cache/apk/*

# ----------------------------------------------------------------
# Create the SSL directory if it doesn't exist
RUN mkdir -p /etc/nginx/ssl/
# ----------------------------------------------------------------

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42/CN=inception.com"

COPY configs/nginx.conf /etc/nginx/sites-available/
COPY ./configs/nginx-entrypoint.sh /


RUN chmod +x ./nginx-entrypoint.sh


# ---------------------------------------------------------------
# # Expose ports for HTTPS (443)
# EXPOSE 443
# ---------------------------------------------------------------


ENTRYPOINT [ "nginx-entrypoint.sh" ]

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
