/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select * from animals where date_of_birth between '2016-01-01' and '2019-12-31';

select * from animals where neutered=1 and escape_attempts<3;

select * from animals where name in ('Agumon', 'Pikachu');

select name, escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered='true';

select * from animals where name not like "gabumon";

select * from animals where weight_kg between 10.5 and 17.3;


start transaction;

update animals set species="unspecified";

select * from animals;

update animals set species='digimon' where name like '%mon';

update animals set species='pokemon' where species = 'null';

commit;

select * from animals;

start transaction;

delete from animals;

rollback;

start TRANSACTION;

delete from animals where date_of_birth > '2022-01-01';

SAVEPOINT SP1;

update animals set weight_kg=(weight_kg*-1);

ROLLBACK TO SP1;

update animals set weight_kg=(weight_kg*-1) where weight_kg<0;

commit;

select  count(*) FROM animals;

select  count(*) FROM animals escape_attempts = 0;

select  count(*) FROM animals where escape_attempts = 0;

select  avg(weight_kg) FROM animals;

select neutered, max(escape_attempts) from animals group by  neutered;

select species, min(weight_kg), max(weight_kg) from animals group by species;

select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;

--What animals belong to Melody Pond?
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

--How many animals are there per species?
SELECT species.name as species_name, count(*) as number_of_animals
FROM animals
INNER JOIN species ON species.id = animals.species_id
GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell
SELECT
owners.full_name as owner_name,
animals.name as animal_name,
species.name as species_name
FROM animals
INNER JOIN species ON species.id = animals.species_id
INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT
owners.full_name as owner_name,
animals.name as animal_name,
animals.escape_attempts
FROM animals
INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT
owners.full_name as most_animals_owner,
count(*) as animals_owned
FROM owners
INNER JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animals_owned DESC
LIMIT 1;
