-- -------
-- PART 1
-- -------

-- Select all owners (no duplicates)
SELECT * FROM owners;

-- Select all columns from pets and owners sorted by owner name, pet name
SELECT pets.*, owners.*
FROM pets
INNER JOIN owners
ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select the number of pets by owner
SELECT COUNT(*), owners.name
FROM pets
INNER JOIN owners
ON pets.owner_id = owners.id
GROUP BY owners.name;

-- Select the average age of pets by owners
SELECT ROUND(AVG(pets.age), 2), owners.name
FROM pets
INNER JOIN owners
ON pets.owner_id = owners.id
GROUP BY owners.name;

-- Select the pet names for all pets over 1 year old and belonging to
-- either Mike or Marc
SELECT pets.name
FROM pets
INNER JOIN owners
ON pets.owner_id = owners.id
WHERE pets.age > 1
AND owners.name in ('Mike', 'Marc');

-- -------
-- PART 2
-- -------

-- Select all columns from pets and owners sorted by owner name, pet named
-- and this time don't forget Snuggles!!!
SELECT pets.*, owners.*
FROM pets
LEFT OUTER JOIN owners
ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select all columns from pets and owners sorted by owner name, pet named
-- and this time don't forget Susan!!!
SELECT pets.*, owners.*
FROM pets
RIGHT OUTER JOIN owners
ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select all columns from pets and owners sorted by owner name, pet named
-- and this time don't forget Snuggles or Susan!!!
SELECT pets.*, owners.*
FROM pets
FULL OUTER JOIN owners
ON pets.owner_id = owners.id
ORDER BY owners.name, pets.name;

-- Select the number of pets by owner
-- and don't forget Susan!!!
SELECT COUNT(pets), owners.name
FROM pets
RIGHT OUTER JOIN owners
ON pets.owner_id = owners.id
GROUP BY owners.name;

