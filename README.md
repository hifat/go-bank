# Setup
1. `sqlc generate`

# Go Bank Workshop
What I learned from this workshop

## Docker
I need to use MySQL because sqlc on Windows support only mysql
```docker
docker run --name mysql8 -p 3306:3306 -e MYSQL_USER=root -e MYSQL_PASSWORD=1234 -e MYSQL_ROOT_PASSWORD=root -d mysql:8
```

```docker
docker exec -it mysql8 mysql -u root -p
```

```docker
docker logs mysql8
```

## DB Migration
### Install
```bash
# MAC OSX
brew install migrate

# Windows(must install scoop)
scoop install migrate
```

### Create file
```bash
migrate create -ext sql -dir db/migration -seq init_schema
```

### Migrate and Drop
```bash
# Up
migrate -path db/migration -database "mysql://root:root@tcp(172.21.48.1:3306)/go_bank" -verbose up

# Down
migrate -path db/migration -database "mysql://root:root@tcp(172.21.48.1:3306)/go_bank" -verbose down
```

## Reference
[TECH SCHOOL](https://www.youtube.com/playlist?list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE)