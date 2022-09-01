mysql:
	docker run --name mysql8 -p 3306:3306 -e MYSQL_USER=root -e MYSQL_PASSWORD=1234 -e MYSQL_ROOT_PASSWORD=root -d mysql:8

shelldb:
	docker exec -it mysql8 mysql -u root -p

migrateup:
	 migrate -path db/migration -database "mysql://root:root@tcp(127.0.0.1:3306)/go_bank" -verbose up

migratedown:
	 migrate -path db/migration -database "mysql://root:root@tcp(127.0.0.1:3306)/go_bank" -verbose down

sqlc:
	sqlc generate

testquery:
	go test ./db/test -v -cover -coverpkg=./db/sqlc

test: testquery

.PHONY: mysql