FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php-fpm php-mysql

COPY ./tools/entryPoint.sh /usr/local/bin/entrypoint.sh 

RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]
