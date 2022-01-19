/*Find all animals whose name ends in "mon".*/

select * from animals where name like'%mon';

/*List the name of all animals born between 2016 and 2019.*/

SELECT name FROM animals WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';

/* List the name of all animals that are neutered and have less than 3 escape attempts.
 */

 select * from animals where neutered=true and escape_attempts>=3;

/*  List date of birth of all animals named either "Agumon" or "Pikachu".
 */

select date_of_birth from animals where name in ('Agumon','Pikachu');

/* List name and escape attempts of animals that weigh more than 10.5kg */

select name,escape_attempts from animals where weight_kg>=10.5;

/* Find all animals that are neutered. */
select * from animals where neutered=true;

/* Find all animals not named Gabumon.
 */
select * from animals where not name='Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
