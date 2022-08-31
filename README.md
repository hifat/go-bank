# Go Bank Workshop
What I learned from this workshop

## Docker
I need to change local port to 5433 because some programs in my computer use postgreSQL too.
```docker
docker run --name postgres12 -p 5433:5432 -e POSTGRES_USER=root POSTGRES_PASSWORD=1234 -d postgres:12.3-alpine
```

```docker
docker exec -it postgres12 psql -U root
```

```docker
docker logs postgres12
```

## DB Migration
```bash
migrate create -ext sql -dir db/migration -seq init_schema
```

```bash
migrate -path db/migration -database "postgresql://root:secret@localhost:5433/go-bank?sslmode=disable" -verbose up

# If use on WSL may have to change localhost to WSL IP such as
# You can check by typing "ipconfig"
migrate -path db/migration -database "postgresql://root:secret@172.21.40.2:5433/go-blank?sslmode=disable" -verbose up
```

## Reference
[TECH SCHOOL](https://www.youtube.com/playlist?list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE)