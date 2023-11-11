migrateup:
	migrate -path dir/migrations -database "postgresql://test:password@localhost:5432/test_db?sslmode=disable" --verbose up

.PHONY: migrateup