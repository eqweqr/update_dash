createcontainer:
	docker run -d --restart always --name psql_test -p 5432:5432 -e POSTGRES_USER=test -e POSTGRES_PASSWORD=password postgres:14
createdb1: 
	docker exec $(docker ps -a --filter status=running --filter ancestor=postgres:14 --format "{{.ID}}") createdb --username=test --owner=test test_db
checkdbs1:
	docker exec psql_test psql --username=test --command='\l'
createmigration:
	migrate create -ext sql -dir dir/migration -seq init
migrateup:
	migrate -path dir/migrations -database "postgresql://test:password@localhost:5432/test_db?sslmode=disable" --verbose up
migratedown:
	migrate -path dir/migrations -database "postgresql://test:password@localhost:5432/test_db?sslmode=disable"
checkmigrations:
	docker exec $(docker ps --format "{{.ID}}") psql -U test -d test_db --command='select * from schema_migrations;'
checktables:
	docker exec psql_test psql -U test -d test_db --command='\dt'
dropmigrations:
	docker exec $(docker ps --format "{{.ID}}") psql -U test -d test_db --command='drop table schema_migrations;'
.PHONY: createcontainer, createdb, checkdbs, createmigration, migrateup, migratedown. checkmigrations. checktables, dropmigrations
ds:
	psql -h указать место машины, где будет запущен сервер.  
	export pgsslmode=verify-full
	export pgsslrootcert=/etc/ssl/certs/rds-ca-2o19-root.pem
go_test: 
	go test -timeout 30s -run ^TestPassword$ . -v count=1
go_test_general:
	go test -v -cover ./...
insert_value:
	docker exec $(docker ps --format '{{.ID}}') psql -U test -d auth_db --command="insert into users(username, password, hobbies, city) values('fs', 'fsa', '{LisghtWeighting, Sport, Programming}', 'fa');"
last_docker:
	docker ps -a --filter ancestor=postgres:14 --format '{{.ID}}' | grep '' -m 1
left_join:
	docker exec -it $(docker ps --format '{{.ID}}') psql -U test -d auth_db --command="select users.username, hobbies.name, hobbies.description from users left join users_hobbies on users.id=users_hobbies.user_id left join hobbies on users_hobbies.hobby_id = hobbies.id;"
sqlc_generate:
	sqlc generate
sqlc_init_file:
	sqlc init
check_type:
	docker exec $(docker ps -q) psql -U test -d auth_db --command="select column_name, data_type from information_schema.columns where column_name='from_account_id'"|\q|pg_typeof()
trans_db:
	docker exec $(docker ps -q) psql -U test -d auth_db -c "begin; insert into transfers(from_account_id, to_account_id, amount) values (4, 5, 100); insert into entries(account_id, amount) values (4, -100), (5, 100); commit;"