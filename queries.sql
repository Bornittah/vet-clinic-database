/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select * from animals where date_of_birth between '2016-01-01' and '2019-12-31';

select * from animals where neutered=1 and escape_attempts<3;

select * from animals where name in ('Agumon', 'Pikachu');

select name, escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered='true';

select * from animals where name not like "gabumon";

select * from animals where weight_kg between 10.5 and 17.3;