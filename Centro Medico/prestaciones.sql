CREATE TABLE "capacitaciones" (
  "id" SERIAL PRIMARY KEY,
  "nombre" VARCHAR(255) NOT NULL,
  "horas" INT NOT NULL DEFAULT 0,
  "codigo" VARCHAR(7) NOT NULL,
  "medico_id" INT
);

CREATE TABLE "medicos" (
  "id" SERIAL PRIMARY KEY,
  "nombre" VARCHAR,
  "apellido" VARCHAR,
  "rut" VARCHAR,
  "profesion" VARCHAR,
  "especialidad" VARCHAR,
  "estado" BOOLEAN DEFAULT true,
  "registro_prestador" VARCHAR UNIQUE
);

CREATE TABLE "pacientes" (
  "id" SERIAL PRIMARY KEY,
  "nombre" varchar,
  "apellido" varchar
);

CREATE TABLE "prestaciones" (
  "id" serial PRIMARY KEY,
  "medico_id" int,
  "paciente_id" int
);

ALTER TABLE "prestaciones" ADD FOREIGN KEY ("medico_id") REFERENCES "medicos" ("id");

ALTER TABLE "prestaciones" ADD FOREIGN KEY ("paciente_id") REFERENCES "pacientes" ("id");

ALTER TABLE "capacitaciones" ADD FOREIGN KEY ("medico_id") REFERENCES "medicos" ("id");
