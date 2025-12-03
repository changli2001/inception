up:
	docker compose up -d
mariadb:
	docker compose up -d MariaDB
WordPress:
	docker compose up -d WordPress
nginx:
	docker compose up -d nginx
mariadb_clean:
	echo "Stopping and removing MariaDB container, volumes, and image..."
	docker compose rm  MariaDB
	docker rmi mariadb:inception --force
fclean:
	docker system prune -a --force

WordpressUP:
	docker compose run -it WordPress
