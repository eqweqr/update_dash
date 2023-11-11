package sqlc

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver  = "postgres"
	sqlSource = "postgresql://test:password@localhost:5432/auth_db?sslmode=disable"
)

var testQueries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	var err error
	testDB, err := sql.Open(dbDriver, sqlSource)
	if err != nil {
		log.Fatal("cannot to connect", err)
	}

	testQueries = New(testDB)

	os.Exit(m.Run())
}
