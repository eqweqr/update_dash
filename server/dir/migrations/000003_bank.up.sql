create table "accounts"(
    "id" bigserial primary key,
    "owner" varchar not null,
    "balance" bigint not null,
    "currency" varchar not null,
    "created_at" timestamp not null default (now())
);

create table "entries" (
    "id" bigserial primary key,
    "account_id" bigint not null,
    "amount" bigint not null,
    "created_at" timestamp not null default (now())
);

create table "transfers"(
    "id" bigserial primary key,
    "from_account_id" bigint not null,
    "to_account_id" bigint not null,
    "amount" bigint not null,
    "created_at" timestamp not null default (now())
);

alter table entries add foreign key(account_id) references accounts(id);
alter table transfers add foreign key (from_account_id) references accounts(id);
alter table transfers add foreign key (from_account_id) references accounts(id);

comment on column "entries"."amount" is 'can be negative or positive';
comment on column "transfers"."amount" is 'must be positibe';