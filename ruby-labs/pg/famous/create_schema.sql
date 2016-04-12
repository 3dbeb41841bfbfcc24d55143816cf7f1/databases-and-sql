DROP TABLE IF EXISTS people;

CREATE TABLE people(
  id         serial8     primary key,
  first      varchar(20) not null,
  last       varchar(20) not null,
  dob        date        check (dob < '1/1/2000'),
  occupation varchar(20) not null,
  hometown   varchar(20)
);
