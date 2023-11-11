migrateup:
	migrate -path server/dir/migrations -database "postgresql://test:password@localhost:5432/auth_db?sslmode=disable" -verbose up

test:
	go test -v -cover ./...

.PHONY: migrateup
