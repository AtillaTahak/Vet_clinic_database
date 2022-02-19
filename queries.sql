/*Find all animals whose name ends in "mon".*/

select * from animals where name like'%mon';

/*List the name of all animals born between 2016 and 2019.*/

SELECT name FROM animals WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';

/* List the name of all animals that are neutered and have less than 3 escape attempts.
 */

 select * from animals where neutered=true and escape_attempts>=3;

/*  List date of birth of all animals named either "Agumon" or "Pikachu.".
 */

select date_of_birth from animals where name in ('Agumon','Pikachu');

/* List name and escape attempts of animals that weigh more than 10.5kg. */

select name,escape_attempts from animals where weight_kg>=10.5;

/* Find all animals that are neutered. */
select * from animals where neutered=true;

/* Find all animals not named Gabumon.
 */
select * from animals where not name='Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/* Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before tranasction. */

begin;
update animals set species='unspecified';
rollback;


 /* 
 vet-clinic=# SELECT * FROM animals;

 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  2 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | 
  3 | Gabumon    | 2018-11-15    |               2 | t        |         8 | 
  4 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | 
  5 | Devimon    | 2017-05-12    |               5 | t        |        11 | 
  6 | Charmander | 2020-02-08    |               0 | f        |       -11 | 
  7 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | 
  8 | Squirtle   | 1993-04-02    |               3 | t        |    -12.13 | 
  9 | Angemon    | 2005-06-12    |               1 | t        |       -45 | 
 10 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | 
 11 | Blossom    | 1998-10-13    |               3 | t        |        17 | 
(10 rows) */

/* Inside a transaction:
Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
Commit the transaction.
Verify that change was made and persists after commit. */

Begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is NULL;
COMMIT;


/* SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  2 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  3 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  5 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  7 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
  9 | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
 10 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  4 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  6 | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
  8 | Squirtle   | 1993-04-02    |               3 | t        |    -12.13 | pokemon
 11 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
(10 rows) */


/* Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.
 */
Begin;
Delete from animals;
Rollback;

/* After the roll back verify if all records in the animals table still exist. After that you can start breath as usual ;) */

select * from animals;


/* Inside a transaction:
Delete all animals born after Jan 1st, 2022.
Create a savepoint for the transaction.
Update all animals' weight to be their weight multiplied by -1.
Rollback to the savepoint
Update all animals' weights that are negative to be their weight multiplied by -1.
Commit transaction */


begin;
delete from animals where date_of_birth>'2022-06-01';
savepoint delete_date;
update animals set weight_kg = weight_kg*-1;
rollback to delete_date;
update animals set weight_kg = weight_kg*-1 where weight_kg<0;
 commit;



/* How many animals are there?
 */
 select count(*) from animals ;

/*  How many animals have never tried to escape? */

 select count(*) from animals where escape_attempts=0;

/*  What is the average weight of animals?
 */

 select avg(weight_kg) from animals;


/* Who escapes the most, neutered or not neutered animals?
 */
  SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

/* What is the minimum and maximum weight of each type of animal? */
  select min(weight_kg),max(weight_kg),species from animals group by species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000?
 */
 select avg(escape_attempts),species from animals where date_of_birth between '1990-01-01' and '2000-01-01' group by species;

 -- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name='Melody Pond';
--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id=species.id WHERE species_id=1;

--List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name,full_name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;

--How many animals are there per species?
SELECT species.name, COUNT(*) from animals JOIN species ON animals.species_id=species.id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Jennifer Orwell' AND species_id=2;


--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id 
WHERE owners.full_name='Dean Winchester' AND escape_attempts=0;

--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;