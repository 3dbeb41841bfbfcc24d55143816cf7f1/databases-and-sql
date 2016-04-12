#!/bin/bash
db=superheroes
dropdb $db
createdb $db
psql -d $db -f create_schema.sql

# psql -d $db -f seeds.sql
ruby load_data.rb superheroes.csv
