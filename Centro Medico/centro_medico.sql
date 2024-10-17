
-- Tabla de médicos

CREATE TABLE medicos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR,
  apellido VARCHAR,
  rut VARCHAR UNIQUE,
  profesion VARCHAR,
  especialidad VARCHAR,
  estado BOOLEAN DEFAULT TRUE,
  registro_prestador VARCHAR UNIQUE
);

INSERT INTO medicos (nombre, apellido, rut, profesion, especialidad, registro_prestador)
VALUES
  ('Juan', 'Pérez', '12345678-9', 'Médico', 'Cardiología', 'REG123456'), 
  ('María', 'López', '98765432-1', 'Médico', 'Pediatría', 'REG654321'), 
  ('Pedro', 'González', '11223344-5', 'Médico', 'Dermatología', 'REG112233'), 
  ('Ana', 'Torres', '55667788-0', 'Médico', '', 'REG556677'), 
  ('Luis', 'Martínez', '22334455-6', 'Médico', 'Traumatología', 'REG223344'), 
  ('Carmen', 'Sánchez', '99887766-5', 'Médico', 'Oftalmología', 'REG998877'), 
  ('Javier', 'Ruiz', '33445566-7', 'Médico', 'Neumología', 'REG334455'), 
  ('Sofía', 'Díaz', '77889900-4', 'Médico', 'Endocrinología', 'REG778899'), 
  ('Carlos', 'Herrera', '00112233-8', 'Médico', 'Psiquiatría', 'REG001122'), 
  ('Laura', 'Castro', '44556677-3', 'Médico', 'Oncología', 'REG445566');

INSERT INTO medicos (nombre, apellido, rut, profesion, especialidad, estado, registro_prestador)
VALUES
  ('Dayanna', 'López', '16528549-4', 'Médico', 'Cardiología', false, 'REG543507');


-- selecciona medicos con apellido López
SELECT * FROM medicos WHERE apellido = 'López';

-- Selecciona "parecidos" -> "LIKE"
SELECT * FROM medicos WHERE apellido LIKE 'L%';

-- Creamos tabla capacitaciones
-- medicos pueden tener 0 o muchas capacitaciones

CREATE TABLE capacitaciones (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  horas INT NOT NULL DEFAULT 0,
  codigo VARCHAR(7) NOT NULL,
  medico_id INT,
  CONSTRAINT fk_medicos
    FOREIGN KEY (medico_id)
    REFERENCES medicos(id)
);

INSERT INTO capacitaciones (nombre, horas, codigo, medico_id)
VALUES
  ('Capacitación en Cardiología', 25, 'car123', 1);


-- Base de datos Escuela
-- Tenemos profesores y cursos
-- Hay que definir las entidades profesores y cursos
-- donde un profesor puede ser profe jefe de 1 curso
