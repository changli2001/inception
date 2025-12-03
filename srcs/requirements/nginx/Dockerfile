FROM debian:bookworm

# FIX 1: Add '-y' so it doesn't ask "Are you sure?" and hang
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

# HTML setup (Standard Debian web root is actually /var/www/html, but localhost works if you configured it)
WORKDIR /var/www/localhost
COPY index.html .

# FIX 2: Change to the Debian configuration directory
WORKDIR /etc/nginx/conf.d/
COPY config.conf .

# SSL Setup (This part is fine)
WORKDIR /etc/nginx/ssl
COPY openssl.cnf ssl.sh .
RUN chmod +x ssl.sh
RUN ./ssl.sh

CMD ["nginx", "-g", "daemon off;"]
