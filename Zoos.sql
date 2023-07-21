/*Creación de la DB MundoZoos*/
CREATE DATABASE "MundoZoos"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

/*Creación de la tabla ZOOS*/
CREATE TABLE zoos (
	zoo_id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	ciudad VARCHAR(50) NOT NULL,
	pais VARCHAR(50) NOT NULL,
	tamaño INT NOT NULL,
	presupuesto_anual INT NOT NULL
);

/*Creación de la tabla ESPECIES*/
CREATE TABLE especies (
	especie_id SERIAL PRIMARY KEY,
	nombre_cientifico VARCHAR(100) NOT NULL,
	nombre_vulgar VARCHAR(50) NOT NULL,
	familia VARCHAR(50) NOT NULL,
	peligro_extinsion BOOL NOT NULL
);

/*Creación de la tabla ANIMALES*/
CREATE TABLE animales (
	id SERIAL PRIMARY KEY,
	especie_id INT NOT NULL,
	sexo BOOL NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	pais_origen VARCHAR(50) NOT NULL,
	continente VARCHAR(10) NOT NULL,
	zoo_id INT NOT NULL,
	/*referencia a los id de las otras tablas*/
	FOREIGN KEY(especie_id) REFERENCES especies(especie_id),
	FOREIGN KEY(zoo_id) REFERENCES zoos(zoo_id)
);