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

