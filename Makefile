migrateup:
	migrate -path server/dir/migrations --database "postgresql://test:password@localhost:5432/auth_db?sslmode=disable" --verbose up

.PHONY: migrateup
