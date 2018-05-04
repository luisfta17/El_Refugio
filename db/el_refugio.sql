DROP TABLE IF EXISTS adopted_animals;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS types_of_animals;

CREATE TABLE types_of_animals (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE animals (
  id serial4 primary key,
  name varchar(255),
  type_id int4 REFERENCES types_of_animals(id) ON DELETE CASCADE,
  age int2,
  admision_date date,
  picture text,
  adoptable BOOLEAN,
  adopted BOOLEAN
);

CREATE TABLE owners (
  id serial4 primary key,
  name varchar(255),
  contact_details text
);

CREATE TABLE adopted_animals (
  id serial4 primary key,
  animal_id int4 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id int4 REFERENCES owners(id) ON DELETE CASCADE,
  adoption_date date
);
