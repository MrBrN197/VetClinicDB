/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS specializations;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS vets;

CREATE TABLE owners (
    id SERIAL NOT NULL PRIMARY KEY,
    full_name varchar(100),
    AGE int
);

CREATE TABLE species (
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE vets (
    id serial not null primary key,
    name varchar(100),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    vet_id int,
    species_id int,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id)
);

CREATE TABLE animals (
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    species_id INT,
    owner_id INT, 
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id)
);

CREATE TABLE visits {
    vet_id int,
    animal_id int,
    date_of_visit date,
    CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_animals FOREIGN KEY(animal_id) REFERENCES animals(id)
}
