# Active Record, ORMs, and Associations

* Active Record is a Ruby based `ORM`
* `ORM` - Object Relational Mapping

## Background

* There is an `impedence mismatch` between the world of Relational Databases and the world of OOP.
* Relational Databases operate on tables consisting of rows and columns where rows can `relate` to other rows via `foreign keys`.
* Objects can have relationships to other objects via:
    - Inheritance
    - Composition
    - Delegation
* While Relational Databases are good at JOINing and filtering data, OOP is good and encapsulating data into nested data structures
* This creates challenges for mapping the data between the OOP world and the Relational Database world.
* `ORM` libraries are designed to solve (or assist in solving) this mapping problem.

## What Does This Mean For Us?

* We can use an `ORM` to manage the mappings between Relational DB tables and OOP objects.
* An `ORM` will generate the SQL statements for us.

What????

## A Simple Active Record Example

See: `labs/active_record


## TODO:

* DB Migrations
* Ruby and Active Record
* Sinatra and Active Record
