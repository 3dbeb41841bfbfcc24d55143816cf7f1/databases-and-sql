# Schemas and SQL

## Learning Objectives - IWBAT

### Concepts

* Describe the following:
  - Database Schema
  - CRUD
  - Table
  - Row
  - Column
  - Primary Key
  - DDL and DML statements
  - SQL Scripts

### Skills

* Create a database
* Create a table
* Create some data in the database
* Read some data from the database
* Update some data in the database
* Delete some data from the database


## Schema

___Schema___: The set of database tables, sequences, indexes, and other
objects that define the structure of a database.


## Tables

Relational Database tables consist of a set of columns that define the
structure and constraints of the table and a set of rows that contain the
data stored in the table.

* column: defines the datatype and constraints for a single piece of data
(such as name, age, city, state, etc.)
    - columns have a data type, such as string, integer, boolean, number
    - columns can have constraints, such as minimum length, maximum value,
      non-null, etc.
* row: a single data record
    - each row has a special column called the Primary Key that uniquely
      identifies that row
* PKs should have no business meaning (best practice)
* a column can be a FK indicating that it is a reference to another row
  (usually in another table)
    - thus a FK contains the PK of the target
    - this is what makes a database *relational*

## Intro to SQL

* SQL stands for Structured Query Language
* SQL lets you access and manipulate databases
* SQL is an ANSI (American National Standards Institute) standard
* SQL is a Standard - BUT....
    - Although SQL is an ANSI (American National Standards Institute)
      standard, there are different versions of the SQL language.
    - Most RDBMS systems are SQL-92 compliant
    - There is little variation in DML syntax
    - There is more variation in supported datatypes and DDL statements.

### What Can You Do with SQL

* Manage Schemas via `DDL` statements:
    - `CREATE DATABASE` - creates a new database
    - `ALTER DATABASE` - modifies a database
    - `CREATE TABLE` - creates a new table
    - `ALTER TABLE` - modifies a table
    - `DROP TABLE` - deletes a table
    - `CREATE INDEX` - creates an index (search key)
    - `DROP INDEX` - deletes an index
    - set permissions on tables, procedures, and views

* Manage Data via `DML` statements:
    - `SELECT` - extracts data from a database
    - `INSERT INTO` - inserts new data into a database
    - `UPDATE` - updates data in a database
    - `DELETE` - deletes data from a database

## Code Along

Note: The following sections can be presented as a Code Along. The only
prerequisite is creating a PostgreSQL database and connecting to it via psql:

```bash
createdb vet_clinic
psql vet_clinic
```

### DDL Statements

#### CREATE a new table:

```sql
/*
here is a multiline comment.
*/
-- A DDL statement to CREATE a TABLE
-- SQL comments start with 2 dashes
CREATE TABLE pets (                   -- table name is usually plural
  id serial PRIMARY KEY,              -- define the Primary Key
  name  varchar(50) NOT NULL,         -- columns have a name, datatype (sometimes with max length), and constraints
  owner varchar(50) NOT NULL,         -- column names are snake_case
  age   integer                       -- this column has no constraints
);                                    -- SQL statements end with a semicolon
```

```sql
# Use PostgreSQL commands to see what just got created:
vet_clinic=# \d   # list all objects
vet_clinic=# \dt  # list all tables
```

#### DROP (delete) a table:

```sql
DROP TABLE IF EXISTS pets;
```

### DML Statements and CRUD

#### Inserting Data - INSERT

```sql
-- INSERT data into a table:
INSERT INTO pets   -- INSERT INTO are SQL keywords
(name, owner, age) -- here we list the columns we want to insert data into
VALUES
('Miko',   'Mike',    2),
('Meisha', 'Mike',    1),
('Deisel', 'Marc',    4),
('Snoopy', 'Charlie', 7),
('Felix',  'John',    9);
```

> Note that SQL commands are case-insensitive but using UPPERCASE for SQL
commands and lowercase for table and column names is a nice convention!

> Note that we do not have to provide a value for the id, it will be
generated for us by the RDBMS and will be guaranteed to be unique for each
row.

#### Reading Data - SELECT

> Reading data from a database is often referred to as *querying* the
database, and the execution of the SELECT statement is often called a
*query*.

```sql
SELECT * FROM pets;               -- '*' means return all columns
SELECT id, name, age FROM pets;   -- we can specify which columns to return
```

> Notice the id values that were generated for us.

#### Removing Duplicates - SELECT DISTINCT

If multiple rows will return the same values for the selected columns, we
can remove duplicates with the `DISTINCT` keyword:

#### SELECT DISTINCT Example

```sql
SELECT owner FROM pets;             -- contains duplicates
SELECT DISTINCT owner FROM pets;    -- no duplicates
```

#### Filtering Results - WHERE Clause

The SELECT statement has a `WHERE` clause for filtering out the results.

#### WHERE CLAUSE Syntax

```sql
SELECT * FROM <table_name>
WHERE <column_name> operator <value>
[AND | OR]
<column_name> operator <value>
```

#### WHERE CLAUSE Example

```sql
-- SELECT all pets with an owner of Mike
SELECT * FROM pets WHERE owner = 'Mike';
```

> Notice that the comparison in the WHERE clause is a single `=`.
> Notice that Strings are in single quotes.

Here is an example using a *GREATER_THAN* operator:

```sql
-- SELECT all pets with an owner of Mike
SELECT * FROM pets WHERE age > 1;
```

Here is an example using *PATTERN* matching on a String:

```sql
SELECT * FROM pets WHERE name LIKE 'M%';
```

You can combine multiple clauses together using the `AND` and `OR` operators.

```sql
SELECT * FROM pets
WHERE age > 1
AND owner LIKE 'M%';
```

#### Comparison Operators

* `=`       Equal
* `<>`      Not equal.
* `!=`      Some versions of SQL also support `!=` for the _not equal_ operator.
* `>`       Greater than
* `<`       Less than
* `>=`      Greater than or equal
* `<=`      Less than or equal
* `BETWEEN` Between an inclusive range - i.e. `BETWEEN x AND y`
* `LIKE`    Search for a pattern - `%BAMA%`
* `IN`      To specify multiple possible values for a column - `IN (1, 2, 3)`

> Note that you will also use WHERE clauses for UPDATE and DELETE statements.

#### Sorting - ORDER BY

* Sorts the result-set by one or more columns
* Sorts the records in ascending order by default
* To sort in a descending order, use the DESC keyword

#### ORDER BY Syntax

```sql
SELECT column_name, column_name
FROM table_name
ORDER BY column_name, column_name ASC|DESC;
```

#### ORDER BY Example

```sql
SELECT * FROM pets
ORDER BY owner, age DESC;
```

### Updating Data - UPDATE

#### UPDATE Syntax

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE some_column = some_value;
```

#### UPDATE Examples

```sql
UPDATE pets
SET age = 2
WHERE id = 2;

UPDATE pets
SET owner = 'Michael'
WHERE id IN (1, 2);
```

> When Updating or Deleting data, it is important to refer to the data being
  modified via its PK (i.e. ID column)!

### Deleting Data - DELETE

#### DELETE Syntax

```sql
DELETE FROM table_name
WHERE some_column = some_value;
```

#### DELETE Examples

```sql
DELETE FROM pets
WHERE id = 2;
```

> Warning: You can easily delete *all* of the data from a table by leaving
  off the `WHERE` clause:

```sql
DELETE FROM table_name;
```

### PSQL Transactions

You can start a new transaction in `psql` using the `BEGIN` command:

```sql
SELECT * FROM pets;
BEGIN;
UPDATE pets SET age=3;   -- Our attempt to update the age of a pet
SELECT * FROM pets;      -- OOPS, we forgot the WHERE clause and updated all of the pets.
ROLLBACK;                -- We just ROLLBACK to get back to before the mistake.
SELECT * FROM pets;

BEGIN;
UPDATE pets SET age=3 WHERE id=1;   -- Using a WHERE clause
SELECT * FROM pets;                 -- Verify that it looks good!
COMMIT;
```

> What happens when you don't use BEGIN/COMMIT/ROLLBACK in PSQL?
> By default, `psql` uses `autocommit`

### SQL Functions

SQL provides `aggregate` functions for summarizing the data in a table:

* AVG() - Returns the average value
* COUNT() - Returns the number of rows
* MAX() - Returns the largest value
* MIN() - Returns the smallest value
* SUM() - Returns the sum

SQL also provides `scalar` functions for transforming an expression:

* UPPER() - Converts a field to upper case
* LOWER() - Converts a field to lower case
* MID() - Extract characters from a text field
* CHAR_LENGTH() - Returns the length of a text field
* ROUND() - Rounds a numeric field to the number of decimals specified
* CURRENT_TIME - Returns the current system date and time
* CURRENT_DATE - Returns the current system date
* TO_CHAR() - Formats how a field or expression is to be displayed

##### Examples

```
SELECT AVG(age) FROM pets;
SELECT ROUND(AVG(age), 2) FROM pets;      -- here we have combined 2 functions
SELECT COUNT(*) FROM pets;
SELECT COUNT(DISTINCT(owner)) FROM pets;  -- how many owners are there?
```

> Note the similarity to working with a Spreadsheet!!!
> SQL is a `declarative` language much like what you use in a Spreadsheet.
> Thus you specify *what* you want, not *how* to calculate it.

```
SELECT * FROM pets
ORDER BY age
LIMIT 1;         -- Works in PosgreSQL and MySQL, but syntax varies.
```

## SQL Scripts

You can run SQL commands in SQL script files.
For example:

```
-- print_pets.sql
SELECT name, age, owner
FROM pets
ORDER BY age;
```

You can run this script via `psql`:

```
psql -d vet_clinic -f print_pets.sql
```

> Notice that you started with the BASH prompt and ended with the BASH prompt!
> The psql command ran a SQL script for you!

## LAB: Shopping Receipts

See: `labs/shopping`
