# Putting the Relational in Relational Database

## Foreign Keys

* A column in one table for storing the PK of a row in another table
* Creates a *relationship* between 2 rows (usually in separate tables)

## Multi-Table Joins

* SQL joins are used to combine rows from two or more tables.
* Joins are usually performed using PKs and FKs.

### Example

First let's create 2 tables with a relationship:

```sql
CREATE TABLE owners (
  id serial PRIMARY KEY,
  name  varchar(50) NOT NULL,
  phone varchar(16)
);

CREATE TABLE pets (
  id serial PRIMARY KEY,
  name      varchar(50) NOT NULL,
  owner_id  integer references owners(id),  -- owner_id is a FK to owners(id)
  age       integer
);
```

The JOIN syntax is:

```sql
SELECT table1.column1, table1.column2, ..., table2.column1, table2.column2, ...
FROM table1 INNER JOIN table2 ON table1.fk = table2.pk;
```

So we can JOIN the above 2 tables like this:

```sql
SELECT pets.*, owners.*
FROM pets INNER JOIN owners ON pets.owner_id = owners.id;
```

## Code Along

See part 1 of `labs/vet_clinic2`

## Inner and Outer Joins

* Much of the SQL language is based on Math and Sets.
* We can JOIN tables using Inner or Outer joins
* Inner Join - returns the _intersection_ of all matching rows.
* Outer Join - returns the _union_ of all matching rows.
* Outer Joins can be `LEFT`, `RIGHT`, or `FULL`

See: [SQL Joins](http://www.codeproject.com/Articles/33052/Visual-Representation-of-SQL-Joins)

### Examples:

See part 2 of `labs/vet_clinic2`


## Intro to ERD Diagrams

* Draw an ERD Diagram for pets & owners


## Many To Many Relationships

* Require a `mapping` table:
* The `mapping` table has 2 FKs: one to each table of the many-to-many relationship.

## Many to Many Lab - Movies DB:

Requirements: Need to store the following:

* A list of movies with name and release date
* A list of directors with first_name and last_name
* A list of actors with first_name and last_name
* A one-to-many between director and movie
* A many-to-many between actor and movie

## Homework - Shopping with 2 tables

Create a `shopping2` database but this time with 2 tables:

* stores     -- should have an id and name
* receipts   -- should have id, store_id, item, number_of_items, price, and buy_date.

Redo the exercises from `shopping` lab but include the JOINS for the 2 tables.
