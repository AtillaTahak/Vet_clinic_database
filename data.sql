/* Populate database with sample data. */

iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Agumon','2020-02-03',0,true,10.23);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Gabumon','2018-11-15',2,true,8);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Pikachu','2021-01-01',1,false,15.04);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Devimon','2021-05-12',5,true,11);

/* 
Insert the following data:
Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
Animal: Her name is Plantmon. She was born on Nov 15th, 2022, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to 3 times.
Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times. */

iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Charmander','2020-02-08',0,false,-11);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Plantmon','2022-11-15',2,true,-5.7);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Squirtle','1993-12-2',3,false,-12.13);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Angemon','2005-06-12',1,true,-45);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Boarmon','2005-06-07',7,true,20.4);
iNSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Blossom','1998-01-13',3,true,17);



-- owners
INSERT INTO owners(owner_id,full_name,age) VALUES (1,'sam smith',34);
INSERT INTO owners(owner_id,full_name,age) VALUES (2,'Jennifer Orwell',19);
INSERT INTO owners(owner_id,full_name,age) VALUES (3,'Bob',45);
INSERT INTO owners(owner_id,full_name,age) VALUES (4,'Melody Pond',77);
INSERT INTO owners(owner_id,full_name,age) VALUES (5,'Dean Winchester',14);
INSERT INTO owners(owner_id,full_name,age) VALUES (6,'Jodie Whittaker',38);
-- Species
INSERT INTO species(species_id,name) VALUES (1,'pokemon');
INSERT INTO species(species_id,name) VALUES (2,'Digimon');

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');