FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y mariadb-server


RUN mkdir -p /run/mysql /var/lib/mysql \
		&& chown -R mysql:mysql /run/mysql /var/lib/mysql

COPY ./tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh


EXPOSE 3306

ENTRYPOINT  ["/bin/sh"]
