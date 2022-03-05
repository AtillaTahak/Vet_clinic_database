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



INSERT INTO vets(NAME,AGE,DATE_OF_GRADUATION) VALUES('William Tatche', 45,'2000-04-23'),
(' Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');
INSERT INTO specializations (species_id,vets_id) VALUES (1,1),(2,3),(1,3),(2,4);
-- Insert the following data for visits:

INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (1, 1, '2020-05-24'),(1, 3, '2020-07-22'),(2, 4, '2021-02-02'),(3, 2, '2020-01-05');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (3, 2, '2020-03-08'),(3, 2, '2020-05-14'),(4, 2, '2021-05-04'),(5, 4, '2021-02-24');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (6, 2, '2019-12-21'),(6, 1, '2020-08-10'),(6, 2, '2021-04-07'),(7, 3, '2019-09-29');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (8, 4, '2020-10-03'),(8, 4, '2020-11-04'),(9, 2, '2019-01-24'),(9, 2, '2019-05-15');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (9, 2, '2020-02-27'),(9, 2, '2020-08-03'),(10, 3, '2020-05-24'),(10, 1, '2021-01-11');


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


INSERT INTO vets(NAME,AGE,DATE_OF_GRADUATION) VALUES('William Tatche', 45,'2000-04-23'),
(' Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');
INSERT INTO specializations (species_id,vets_id) VALUES (1,1),(2,3),(1,3),(2,4);
-- Insert the following data for visits:

INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (1, 1, '2020-05-24'),(1, 3, '2020-07-22'),(2, 4, '2021-02-02'),(3, 2, '2020-01-05');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (3, 2, '2020-03-08'),(3, 2, '2020-05-14'),(4, 2, '2021-05-04'),(5, 4, '2021-02-24');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (6, 2, '2019-12-21'),(6, 1, '2020-08-10'),(6, 2, '2021-04-07'),(7, 3, '2019-09-29');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (8, 4, '2020-10-03'),(8, 4, '2020-11-04'),(9, 2, '2019-01-24'),(9, 2, '2019-05-15');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (9, 2, '2020-02-27'),(9, 2, '2020-08-03'),(10, 3, '2020-05-24'),(10, 1, '2021-01-11');



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits 
  (animal_id, vet_id, date_of_visit) 
  SELECT * 
  FROM (SELECT id FROM animals) animal_ids, 
  (SELECT id FROM vets) 
  vets_ids, 
  generate_series
  ('1980-01-01'::timestamp, '2021-01-01', '4 hours') 
  visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email, age) 
  select 'Owner ' || generate_series(1,2500000), 
  'owner_' || generate_series(1,2500000) || '@mail.com'
  || generate_series(1,2500000);