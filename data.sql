/* Populate database with sample data. */

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', '2020-02-03', 0, TRUE, 10.23),
    ('Gabumon', '2018-11-15', 2, TRUE, 8),
    ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
    ('Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Charmander', '2020-02-08', 0, TRUE, -11),
    ('Plantmon', '2021-11-15', 2, TRUE, -5.7),
    ('Squirtle', '1993-04-02', 3, TRUE, -12.13),
    ('Angemon', '2005-06-12', 1, FALSE, -45),
    ('Boarmon', '2005-06-07', 7, TRUE, 20.4),
    ('Blossom', '1998-10-13', 3, TRUE, 17),
    ('Ditto', '2022-05-14', 4, TRUE, 22);


INSERT INTO
    owners(full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE  name = 'Digimon') WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE  name = 'Pokemon') WHERE name  NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE  full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE  full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE  full_name = 'Bob') WHERE name IN ('Devimon' , 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE  full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE  full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

/*
 Insert the following data for vets:
 Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
 Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
 Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
 Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
 */
 
INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45,'2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (species_id, vet_id)
SELECT species.id,vets.id
FROM species,vets
WHERE species.name = 'Pokemon'
AND vets.name = 'William Tatcher';

-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (species_id, vet_id)
SELECT species.id,vets.id
FROM species,vets
WHERE species.name IN ('Digimon', 'Pokemon')
AND vets.name = 'Stephanie Mendez';


-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (species_id, vet_id)
SELECT species.id,vets.id
FROM species,vets
WHERE species.name = 'Digimon'
AND vets.name = 'Jack Harkness';


/*
Agumon visited William Tatcher on May 24th,
2020.Agumon visited Stephanie Mendez on Jul 22th,
2020.Gabumon visited Jack Harkness on Feb 2nd,
2021.Pikachu visited Maisy Smith on Jan 5th,
2020.Pikachu visited Maisy Smith on Mar 8th,
2020.Pikachu visited Maisy Smith on May 14th,
2020.Devimon visited Stephanie Mendez on May 4th,
2021.Charmander visited Jack Harkness on Feb 24th,
2021.Plantmon visited Maisy Smith on Dec 21st,
2019.Plantmon visited William Tatcher on Aug 10th,
2020.Plantmon visited Maisy Smith on Apr 7th,
2021.Squirtle visited Stephanie Mendez on Sep 29th,
2019.Angemon visited Jack Harkness on Oct 3rd,
2020.Angemon visited Jack Harkness on Nov 4th,
2020.Boarmon visited Maisy Smith on Jan 24th,
2019.Boarmon visited Maisy Smith on May 15th,
2019.Boarmon visited Maisy Smith on Feb 27th,
2020.Boarmon visited Maisy Smith on Aug 3rd,
2020.Blossom visited Stephanie Mendez on May 24th,
2020.Blossom visited William Tatcher on Jan 11th,
2021.
*/


-- Agumon visited William Tatcher on May 24th, 2020.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24'
FROM animals, vets
WHERE animals.name = 'Agumon'
AND vets.name = 'William Tatcher';

-- Agumon visited Stephanie Mendez on Jul 22th, 2020

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-07-22'
FROM animals, vets
WHERE animals.name = 'Agumon'
AND vets.name = 'Stephanie Mendez';

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id,'2021-02-02'
FROM animals, vets
WHERE animals.name = 'Gabumon'
AND vets.name = 'Jack Harkness';
    
-- Pikachu visited Maisy Smith on Jan 5th, 2020.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id,vets.id, '2020-01-05'
FROM animals, vets
WHERE animals.name = 'Pikachu'
AND vets.name = 'Maisy Smith';

-- Pikachu visited Maisy Smith on Mar 8th, 2020.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id,'2020-03-08'
FROM animals, vets
WHERE animals.name = 'Pikachu'
AND vets.name = 'Maisy Smith';

-- Pikachu visited Maisy Smith on May 14th, 2020.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-14'
FROM animals, vets
WHERE animals.name = 'Pikachu'
AND vets.name = 'Maisy Smith';

-- Devimon visited Stephanie Mendez on May 4th, 2021.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-05-04'
FROM animals, vets
WHERE animals.name = 'Devimon'
AND vets.name = 'Stephanie Mendez';

-- Charmander visited Jack Harkness on Feb 24th, 2021.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-02-24'
FROM animals, vets
WHERE animals.name = 'Charmander'
AND vets.name = 'Jack Harkness';

-- Plantmon visited Maisy Smith on Dec 21st, 2019.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id,'2019-12-21'
FROM animals,vets
WHERE animals.name = 'Plantmon'
AND vets.name = 'Maisy Smith';

-- Plantmon visited William Tatcher on Aug 10th, 2020.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id,'2020-08-10'
FROM animals, vets
WHERE animals.name = 'Plantmon'
AND vets.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, ' 2021-04-07'
FROM animals, vets
WHERE animals.name = 'Plantmon'
AND vets.name = 'Maisy Smith';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-09-29'
FROM animals, vets
WHERE animals.name = 'Squirtle'
AND vets.name = 'Stephanie Mendez';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id,vets.id,'2020-10-03'
FROM animals,vets
WHERE animals.name = 'Angemon'
AND vets.name = 'Jack Harkness';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-11-04'
FROM animals, vets
WHERE animals.name = 'Angemon'
AND vets.name = 'Jack Harkness';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-01-24'
FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-05-15'
FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-02-27'
FROM  animals, vets
WHERE  animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-08-03'
FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24'
FROM animals, vets
WHERE animals.name = 'Blossom'
AND vets.name = 'Stephanie Mendez';


INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-01-11'
FROM animals,  vets
WHERE animals.name = 'Blossom'
AND vets.name = 'William Tatcher';

-- Data realted to database performance audit

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
