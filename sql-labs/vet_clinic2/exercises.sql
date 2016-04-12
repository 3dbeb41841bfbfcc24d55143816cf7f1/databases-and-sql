-- -------
-- PART 1
-- -------

-- Select all owners (no duplicates)
SELECT * FROM owners;

-- Select all columns from pets and owners sorted by owner name, pet name
SELECT * FROM pets
INNER JOIN owners ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select the number of pets by owner
SELECT count(*), owners.id, owners.name
FROM pets LEFT OUTER JOIN owners ON pets.owner_id = owners.id
GROUP BY owners.id;

-- Select the average age of pets by owners
SELECT owners.id, owners.name, AVG(pets.age)
FROM pets LEFT OUTER JOIN owners ON pets.owner_id = owners.id
GROUP BY owners.id;

-- Select the pet names for all pets over 1 year old and belonging to
-- either Mike or Marc
SELECT pets.name
FROM pets INNER JOIN owners ON pets.owner_id = owners.id
WHERE owners.name IN ('Mike', 'Marc')
AND pets.age > 1;

-- -------
-- PART 2
-- -------

-- Select all columns from pets and owners sorted by owner name, pet name
-- and this time don't forget Snuggles!!!
SELECT pets.*, owners.*
FROM pets LEFT OUTER JOIN owners ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select all columns from pets and owners sorted by owner name, pet named
-- and this time don't forget Susan!!!
SELECT pets.*, owners.*
FROM pets RIGHT OUTER JOIN owners ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select all columns from pets and owners sorted by owner name, pet named
-- and this time don't forget Snuggles or Susan!!!
SELECT pets.*, owners.*
FROM pets FULL OUTER JOIN owners ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select the number of pets by owner
-- and don't forget Susan!!!
SELECT owners.id, owners.name, count(pets)
FROM pets FULL OUTER JOIN owners ON pets.owner_id = owners.id
GROUP BY owners.id;

SELECT owners.id, owners.name, count(pets)
FROM pets FULL OUTER JOIN owners ON pets.owner_id = owners.id
GROUP BY owners.id;


SELECT age, count(*)
FROM pets
GROUP BY age
ORDER BY age;
