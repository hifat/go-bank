package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/go-sql-driver/mysql"
	db "github.com/hifat/go-bank/db/sqlc"
)

const (
	dbDriver = "mysql"
	dbSource = "root:root@tcp(127.0.0.1:3306)/go_bank?charset=utf8&parseTime=True&loc=Local"
)

var testQueries *db.Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Cannot connect to db: ", err)
	}

	testQueries = db.New(conn)
	os.Exit(m.Run())
}
