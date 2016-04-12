-- We must insert owners BEFORE pets
INSERT INTO owners (id, name, phone)
VALUES
(1, 'Mike',    '678-957-9556'),
(2, 'Marc',    '867-5309'),
(3, 'Charlie', '123-4567'),
(4, 'John',    '1-800-432-5000'),
(5, 'Susan',   '777-666-5555');

SELECT setval('owners_id_seq', 10, false);

INSERT INTO pets
(name, owner_id, age)
VALUES
('Miko',     1,    2),
('Meisha',   1,    1),
('Deisel',   2,    4),
('Snoopy',   3,    7),
('Felix',    4,    9),
('Snuggles', null, 2);
