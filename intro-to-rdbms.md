# Intro To Relational Databases
(45 minutes with short lab)

This lesson and lab is intended to introduce the concepts of Relational
Databases, database processes and files, clients and servers, and introduce
the PostgreSQL RDBMS.

## Learning Objectives - IWBAT

### Concepts

* Describe why we use Databases
* Describe the following terms:
  - RDBMS
  - Database

### Skills

* Verify that PostgreSQL is installed
* Start PostgreSQL server
* Verify the status of the PostgreSQL server
* Create a database
* Connect to database via `psql`
* List the database names

## Why Do We Use Databases?

* Memory vs. Persistent Storage
    - CPU / Registers / Cache --> Memory --> Hard Drive --> Server / Cloud

* Files vs Databases
    - Databases are optimized for speed and expressiveness
    - Databases provide for ACID properties

* Databases are fault tolerant
    - Databases are designed with special features that prevent data loss
      or corruption

* Scalability
    - Databases are designed to maximize throughput and parallel access

## Database Concepts

### RDBMS

* Relational Database Management System
* Consists of:
    - a set of databases - `finances`, `nba_stats`, `favorite_movies`
    - a set of database processes that manage the databases and provide
      services for client connections

### Client / Server

* A RDBMS is a server that you can connect to via:
    - a command line client (for DBAs, developers, QA)
    - a GUI client  (for DBAs, developers, QA)
    - an application

* Our Sinatra / Rails apps will be both a (web app) server and a (DB) client!

## CRUD

CRUD is an acronym for describing the basic operations for managing database
records:

* Create -- Creates a new record.
* Read   -- Reads an existing record (or records).
* Update -- Updates an existing record (or records).
* Delete -- Deletes an existing record (or records),
            and *may* cascade on to delete all related records.

### Relational Databases:

* Data stored in tables that contain rows and columns
* Stores _relationships_ between data across tables

## LAB: Getting Familiar with PostgreSQL

See: `intro_to_postgresql.md`


## Transactions, Commit, Rollback, ACID

A system for guarenteeing database transactions and integrity:

* Atomic
* Consist
* Isolated
* Durable

Consider the transfer of funds between two bank accounts:

* Atomicity - requires that each transaction be "all or nothing":
              if one part of the transaction fails, the entire
              transaction fails, and the database state is left
              unchanged. - ie: one account isn't debited without
              the other account being credited.

* Consistency - guarantees that each transaction will bring the
                database from one valid state to another valid
                state. The resultant data must abide by the
                rules of the database. *ie: transactions that
                would take an account below zero must be
                preemptively aborted.

* Isolated - The isolation property ensures that the concurrent
             execution of transactions results in a system state
             that would be obtained if transactions were executed
             serially, i.e. one after the other.

* Durability - guarantees that all confirmed transactions are
               recorded and thus reproducible in the event of a
               system failure (power loss, crash, or other error).

## Data Types

Generic:

* VARCHAR
* BOOLEAN
* INTEGER
* NUMBER
* MONEY
* DATE

[PostgreSQL Data Types](http://www.postgresql.org/docs/9.2/static/datatype.html)

> The `PG` gem will convert between Ruby datatypes and PostgreSQL Data Types!!!

## Primary Keys

* Every Table defines a PK
* The PK is a column that contains a unique value for each row
* We use the PK to uniquely refer to a specific row
