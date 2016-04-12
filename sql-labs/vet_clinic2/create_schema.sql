DROP TABLE IF EXISTS pets;      -- order of drops matters here.
DROP TABLE IF EXISTS owners;

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
