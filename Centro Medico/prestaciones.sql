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

-- prestaciones
-- id
-- id_medico
-- id_paciente
-- fecha
-- hora
-- observacion
-- prevision
-- motivo

ALTER TABLE "prestaciones" ADD COLUMN "fecha" DATE ;

ALTER TABLE "prestaciones"
ADD COLUMN hora TIME,
ADD COLUMN observacion VARCHAR(255),
ADD COLUMN prevision VARCHAR(100),
ADD COLUMN motivo VARCHAR(255);

ALTER TABLE "prestaciones" add constraint ck_motivo
CHECK (motivo IN ('cs123', 'cs542', 'cs621'));

insert  into  pacientes (nombre, apellido)
values 
  ('Juan Carlos', 'Bodoque'),
  ('Tulio', 'Triviño');

INSERT INTO medicos (nombre, apellido, rut, profesion, especialidad, registro_prestador)
VALUES
  ('Juan', 'Pérez', '12345678-9', 'Médico', 'Cardiología', 'REG123456'),
  ('María', 'López', '98765432-1', 'Médico', 'Pediatría', 'REG654321'),
  ('Pedro', 'González', '11223344-5', 'Médico', 'Dermatología', 'REG112233'),
  ('Ana', 'Torres', '55667788-0', 'Médico', 'Ginecología', 'REG556677'),
  ('Luis', 'Martínez', '22334455-6', 'Médico', 'Traumatología', 'REG223344'),
  ('Carmen', 'Sánchez', '99887766-5', 'Médico', 'Oftalmología', 'REG998877'),
  ('Javier', 'Ruiz', '33445566-7', 'Médico', 'Neumología', 'REG334455'),
  ('Sofía', 'Díaz', '77889900-4', 'Médico', 'Endocrinología', 'REG778899'),
  ('Carlos', 'Herrera', '00112233-8', 'Médico', 'Psiquiatría', 'REG001122'),
  ('Laura', 'Castro', '44556677-3', 'Médico', 'Oncología', 'REG445566'),
  ('Dayanna', 'López', '16528549-4', 'Médico', 'Cardiología', 'REG543507');

insert into prestaciones 
  ( medico_id , paciente_id , fecha , hora , observacion , prevision , motivo  )
values
  (1, 1, '2024-10-18', '14:30:00', 'Consulta general', 'Fonasa', 'cs123'),
  (2, 2, '2024-10-19', '10:00:00', 'Revisión anual', 'Isapre', 'cs542'),
  (3, 1, '2024-10-20', '09:45:00', 'Chequeo postoperatorio', 'Fonasa', 'cs621');


