create TABLE "users"(
    "id" bigserial not null primary key,
    "username" text not null,
    "password" text not null,
    -- "hobbies" text[] not null default '{Nothing}',
    "city" text not null
);

create table "hobbies"(
    "id" bigserial primary key,
    "name" text not null,
    "description" text not null
);

create table "users_hobbies"(
    "id" bigserial primary key,
    "user_id" bigserial,
    "hobby_id" bigserial
);

alter table users_hobbies add foreign key (user_id) references users (id);

alter table users_hobbies add foreign key (hobby_id) references hobbies (id);

insert into hobbies(name, description) values('sport', 'not my favorit');
insert into hobbies(name, description) values('programming', 'profit');
insert into hobbies(name, description) values('golfe', 'very expansive');

insert into users(username, password, city) values('Artem', 'fdsa', 'Moscow');
insert into users(username, password, city) values('Alex', 'ffsaewq', 'Kostroma');
insert into users(username, password, city) values('Stas', 'fwwqdsa', 'Ivanovo');
insert into users(username, password, city) values('Sas', 'fds311a', 'Moscow');
insert into users(username, password, city) values('Shara', 'fdsa321ew', 'Moscow');

insert into users_hobbies(user_id, hobby_id) values(1, 1);
insert into users_hobbies(user_id, hobby_id) values(1, 2);
insert into users_hobbies(user_id, hobby_id) values(1, 3);
insert into users_hobbies(user_id, hobby_id) values(2, 1);
insert into users_hobbies(user_id, hobby_id) values(4, 2);
insert into users_hobbies(user_id, hobby_id) values(5, 1);
insert into users_hobbies(user_id, hobby_id) values(5, 3);