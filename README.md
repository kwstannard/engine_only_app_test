# Engine Only Test

I have a theory that it is possible and beneficial for large teams to have a single app for ease of development while at the same time maintaining separation of responsibilities by placing all code into gems and engines.

## Setup
One of the engines uses postgresql, so install that first.
```
cd base_app
bundle install
rake engines:db:create
rake engines:db:migrate
```
You will see 3 migrations, but each migration is actually going to a different database.

## Interesting tests
- You can migrate and rollback individual engine databases.
- You can drop and create the pg_engine database (sqlite doesn't drop dbs)

## TODO
- better base app dump solution. Schemas shouldn't change when running migrations in base app. Maybe delete dump from the base app migrations?
- get authentication working
- do some cross gem functionality
