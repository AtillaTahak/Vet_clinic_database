/* Database schema to keep the structure of entire database. */
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(250), 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL, 
    PRIMARY KEY(id)
    );

/* Add a column species of type string to your animals table.
 */
 ALTER TABLE animals add species varchar(255);


/* Create a table named owners with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
full_name: string
age: integer */

 CREATE TABLE public.owners (
    id integer NOT NULL,
    full_name character varying(100),
    age integer
);

/* Create a table named species with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string */


CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying(100)
);



ALTER TABLE animals DROP COLUMN species;
--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);


/* NEW TABLE "vets" */
CREATE TABLE vets(
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   name VARCHAR (250) NOT NULL,
   age INT,
   date_of_graduation DATE NOT NULL
);

/* Create a "join table" called specializations to handle the relationship between species and vets */
CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  species_id INT,
  vet_id INT,
  CONSTRAINT fk_special_species 
  FOREIGN KEY (species_id)
  REFERENCES species (id),
  CONSTRAINT fk_special_vets 
  FOREIGN KEY (vet_id)
  REFERENCES vets (id),
);

/* Create a "join table" called visits to handle the relationship between animals and vets */
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  animal_id INT,
  vet_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_visit_animal 
  FOREIGN KEY (animal_id)
  REFERENCES animals (id),
  CONSTRAINT fk_visit_vets 
  FOREIGN KEY (vet_id)
  REFERENCES vets (id)
);

-- Add an email column to your owners table
ALTER TABLE owners 
  ADD COLUMN email VARCHAR(120);

-- commands to create indexes for the visits and owners table
CREATE INDEX animals_id_asc ON visits(animal_id asc);
CREATE INDEX vet_id_asc ON visits(vet_id asc);
CREATE INDEX email_asc ON owners(email asc);