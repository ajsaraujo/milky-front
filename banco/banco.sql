CREATE SCHEMA multiverse;

CREATE TABLE planetarySystem(
	systemId SERIAL,
	numOfPlanets INT,
	numOfStars INT,
	age INT,
	name VARCHAR(255),

	CONSTRAINT pk_pSystem PRIMARY KEY (systemId)
);

CREATE TABLE galaxy(
	galaxyId SERIAL,
	numOfSystems INT,
	earthDistance INT,
	name VARCHAR(255) NOT NULL,
	systemId INT,

	CONSTRAINT pk_galaxy PRIMARY KEY (galaxyId)
	CONSTRAINT fk_system FOREIGN KEY (systemId) REFERENCES multiverse.planetarySystem(systemId) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE planet(
	planetId SERIAL,
	size INT,
	weight INT,
	rotationSpeed INT,
	hasSatellite BOOL,
	name VARCHAR(255) NOT NULL,
	compositon VARCHAR(255),

	CONSTRAINT pk_planet PRIMARY KEY (planetId)
);

CREATE TABLE star(
	starId SERIAL,
	size INT,
	age INT,
	earthDisance INT,
	hasSatellite BOOL,
	name VARCHAR(255) NOT NULL,

	CONSTRAINT pk_star PRIMARY KEY (starId)
);

CREATE TABLE satellite(
	satelliteId SERIAL,
	size INT,
	weight INT,
	name VARCHAR(255) NOT NULL,
	compositon VARCHAR(255),

	CONSTRAINT pk_satellite PRIMARY KEY (satelliteId)
);

CREATE TABLE planet_in_system(
	planetId INT,
	systemId INT,

	CONSTRAINT fk_planet FOREIGN KEY (planetId) REFERENCES multiverse.planet(planetId) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_system FOREIGN KEY (systemId) REFERENCES multiverse.planetarySystem(systemId) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE star_in_system(
	starId INT,
	systemId INT,
	CONSTRAINT fk_star FOREIGN KEY (starId) REFERENCES multiverse.star(starId) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_system FOREIGN KEY (systemId) REFERENCES multiverse.planetarySystem(systemId) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE orbit(
	planetId INT,
	starId INT,
	satelliteId INT,

	CONSTRAINT fk_planet FOREIGN KEY (planetId) REFERENCES multiverse.planet(planetId) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_star FOREIGN KEY (starId) REFERENCES multiverse.star(starId) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_satellite FOREIGN KEY (satelliteId) REFERENCES multiverse.satellite(satelliteId) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE red_star(
	star_id INT,
	CONSTRAINT pk_red_star PRIMARY KEY (star_id),
	CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES multiverse.star(star_id) ON DELETE CASCADE ON UPDATE CASCADE, 
)