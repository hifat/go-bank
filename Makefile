posgres:
	docker run --name posgres12 -p 5433:5432 -e POSTGRES_USERNAME=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root go_bank

dropdb:
	docker exec -it postgres12 dropdb go_bank

migrateup:
	 migrate -path db/migration -database "postgresql://root:secret@172.21.48.1:5433/go-blank?sslmode=disable" -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://root:secret@172.21.48.1:5433/go-blank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb