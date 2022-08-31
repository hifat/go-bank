mysql:
	docker run --name mysql8 -p 3306:3306 -e MYSQL_USER=root -e MYSQL_PASSWORD=1234 -e MYSQL_ROOT_PASSWORD=root -d mysql:8

shelldb:
	docker exec -it mysql8 mysql -u root -p

migrateup:
	 migrate -path db/migration -database "mysql://root:root@tcp(172.21.48.1:3306)/go_bank" -verbose up

migratedown:
	 migrate -path db/migration -database "mysql://root:root@tcp(172.21.48.1:3306)/go_bank" -verbose down

sqlc:
	sqlc generate

.PHONY: mysql