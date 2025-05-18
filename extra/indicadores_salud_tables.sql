CREATE TABLE Provincia (
    id_prov SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    poblacion_total INTEGER NOT NULL
);

CREATE TABLE Persona (
    nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	segundo_nombre VARCHAR(100),
	segundo_apellido VARCHAR(100),
	tipo_documento VARCHAR(10) NOT NULL,
	numero_documento VARCHAR(20) UNIQUE NOT NULL,
	sexo CHAR(1) CHECK (sexo IN ('M', 'F', 'X')),
	fecha_nacimiento DATE,
	id_provincia INT NOT NULL REFERENCES Provincia(id_prov),
    cobertura_medica VARCHAR(5) CHECK (cobertura_medica IN ('CPE', 'Mixta')),
	PRIMARY KEY (numero_documento, tipo_documento)
);

CREATE TABLE EfectorDeSalud (
    cod_refes SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
	id_prov INT NOT NULL REFERENCES Provincia(id_prov),
	nivel VARCHAR(20) CHECK (nivel IN ('Primer Nivel', 'Segundo Nivel', 'Tercer Nivel')) 
);

CREATE TABLE EfectorTercerNivel (
	cod_refes INTEGER PRIMARY KEY,
    tipo VARCHAR(50) CHECK (tipo IN ('Alta Tecnología', 'Instituto Especializado')),
    FOREIGN KEY (cod_refes) REFERENCES EfectorDeSalud(cod_refes)
);

CREATE TABLE Servicio (
    cod_servicio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE EfectorDeSaludServicio (
	cod_refes INT REFERENCES EfectorDeSalud(cod_refes),
    cod_servicio INT REFERENCES Servicio(cod_servicio),
    PRIMARY KEY (cod_refes, cod_servicio)
);

CREATE TABLE HCE (
	id_HCE SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	id_prov INT NOT NULL REFERENCES Provincia(id_prov),
	tipo_gestion VARCHAR(10) CHECK (tipo_gestion in ('Provincial', 'Proveedor')),
	tipo_desarrollo VARCHAR(10) CHECK (tipo_desarrollo in ('Propio', 'Licencia')),
	gestion_estudios VARCHAR(15) CHECK (gestion_estudios in ('Gestiona', 'No gestiona')),
	generacion_receta_digital VARCHAR(10) CHECK (generacion_receta_digital in ('Genera', 'No genera'))
);

CREATE TABLE HCEGeneraReceta (
	id_HCE int PRIMARY KEY,
	farmacias_asociadas VARCHAR(10) CHECK (farmacias_asociadas IN ('Públicas', 'Todas')),
	FOREIGN KEY (id_HCE) REFERENCES HCE(id_HCE)
);

CREATE TABLE HCEGeneraPrepagas (
	id_HCE int PRIMARY KEY,
	FOREIGN KEY (id_HCE) REFERENCES HCEGeneraReceta(id_HCE)
);

CREATE TABLE HCEGeneraObrasSociales (
	id_HCE int PRIMARY KEY,
	FOREIGN KEY (id_HCE) REFERENCES HCEGeneraReceta(id_HCE)
);

CREATE TABLE Capacidad (
	cod_capacidad SERIAL PRIMARY KEY,
	nombre varchar(100) NOT NULL,
	descripcion TEXT
);

CREATE TABLE HCECapacidad (
	id_HCE INT REFERENCES HCE(id_HCE),
    cod_capacidad INT REFERENCES Capacidad(cod_capacidad),
    PRIMARY KEY (id_HCE, cod_capacidad)
);

CREATE TABLE DocumentoDigital (
    id_documento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) CHECK (tipo IN ('Estudio de Laboratorio', 'Práctica Médica'))
);

CREATE TABLE FormaEnvio (
    id_forma_envio SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE AccedeDocumento (
    id_HCE INT REFERENCES HCE(id_HCE),
    id_documento INT REFERENCES DocumentoDigital(id_documento),
    id_forma_envio INT REFERENCES FormaEnvio(id_forma_envio),
    PRIMARY KEY (id_HCE, id_documento, id_forma_envio)
);


