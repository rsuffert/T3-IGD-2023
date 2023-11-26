CREATE TABLE hospitais (
	id_hospital				INT				PRIMARY KEY,
	municipio				VARCHAR(100)	NOT NULL,
	nome					VARCHAR(100)	NOT NULL
);

CREATE TABLE pacientes (
	id_paciente				INT				PRIMARY KEY,
	ano_nasc				INT				NULL,
	sexo					CHAR(1)			NULL,
	municipio_residencia	VARCHAR(100)	NOT NULL,
	CONSTRAINT check_pacientes_sexo CHECK(sexo = 'F' OR sexo = 'M')
);

CREATE TABLE internacoes (
	id_internacao			SERIAL PRIMARY KEY,
	id_paciente				INT				NOT NULL,
	id_hospital				INT				NOT NULL,
	tipo_leito				VARCHAR(50)		NOT NULL,
	tipo_internacao			VARCHAR(50)		NOT NULL,
	data_solicitacao		DATE			NOT NULL,
	data_autorizacao		DATE			NOT NULL,
	carater					VARCHAR(50)		NOT NULL,
	codigo_cid				VARCHAR(10)		NOT NULL,
	data_alta				DATE			NULL,
	situacao				VARCHAR(50)		NOT NULL,
	data_internacao			DATE			NOT NULL,
	FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
	FOREIGN KEY (id_hospital) REFERENCES hospitais(id_hospital)
);