## Ruby with PG Gem

* Since not all RDBMS products behave the same way, we need a way to `adapt`
  to the differences, such as:
    - differing data types
    - differing DDL statements

* The `adapter` we use to connect a Ruby program to a PostgreSQL database
  is the `PG` gem.

* Once we have the `PG` gem installed and required, we can easily connect
  to a PostgreSQL database and issue various `DDL` and `DML` statements.

### Code Along: SuperHeroes

> TODO: create a starter project for this Code Along

* We are going to create a `superheroes` DB with a single table
* We will be writing a Ruby program to do CRUD operations on the table using
  the `PG` gem
* See the `labs/superheroes/setup` folder for the setup
* We are going to create the following Ruby classes:
    - SuperHero
    - SuperHeroManager
* We will also create a Ruby script to kick off the program

## TODO:

* Ruby
* Sinatra and PG Gem
* Camping Store
