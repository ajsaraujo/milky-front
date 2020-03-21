CREATE SCHEMA multiverse;

CREATE TABLE planetarySystem(
	system_id SERIAL,
	galaxy_id INT,
	num_of_planets INT,
	num_of_stars INT,
	age INT,
	name VARCHAR(255),

	CONSTRAINT pk_pSystem PRIMARY KEY (system_id),
	CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES multiverse.galaxy(galaxy_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE galaxy(
	galaxy_id SERIAL,
	num_of_systems INT,
	earth_distance INT,
	name VARCHAR(255) NOT NULL,

	CONSTRAINT pk_galaxy PRIMARY KEY (galaxy_id),
);

CREATE TABLE planet(
	planet_id SERIAL,
	size INT,
	weight INT,
	rotation_speed INT,
	has_satellite BOOL,
	name VARCHAR(255) NOT NULL,
	compositon VARCHAR(255),

	CONSTRAINT pk_planet PRIMARY KEY (planet_id)
);

CREATE TYPE star_type AS ENUM ('ana branca', 'ana vermelha', 'estrela binaria', 'gigante azul', 'gigante vermelha')

CREATE TABLE star(
	star_id SERIAL,
	size INT,
	age INT,
	earth_distance INT,
	has_satellite BOOL,
	is_blackhole BOOL,
	name VARCHAR(255) NOT NULL,
	statType star_type,

	CONSTRAINT pk_star PRIMARY KEY (star_id)
);

CREATE TABLE satellite(
	satellite_id SERIAL,
	size INT,
	weight INT,
	name VARCHAR(255) NOT NULL,
	compositon VARCHAR(255),

	CONSTRAINT pk_satellite PRIMARY KEY (satellite_id)
);

CREATE TABLE planet_in_system(
	planet_id INT,
	system_id INT,

	CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES multiverse.planet(planet_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_system FOREIGN KEY (system_id) REFERENCES multiverse.planetarySystem(system_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pk_planet_in_system PRIMARY KEY (planet_id,system_id),
);

CREATE TABLE star_in_system(
	star_id INT,
	system_id INT,
	CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES multiverse.star(star_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_system FOREIGN KEY (system_id) REFERENCES multiverse.planetarySystem(system_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pk_star_in_system PRIMARY KEY (star_id,system_id),
);
-- Relação ainda indefinida e precisa ser trabalhada... Tô sem saber como fazer
CREATE TABLE orbit(
	planet_id INT,
	star_id INT,
	satellite_id INT,

	CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES multiverse.planet(planet_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES multiverse.star(star_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_satellite FOREIGN KEY (satellite_id) REFERENCES multiverse.satellite(satellite_id) ON DELETE CASCADE ON UPDATE CASCADE,
);
