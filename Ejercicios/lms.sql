-- crea base de datos
CREATE DATABASE lms_development;

-- se conecta a la base de datos
\c lms_development

-- Borra tablas en caso que existan
DROP IF EXISTS TABLE respuestas;
DROP IF EXISTS TABLE preguntas;
DROP IF EXISTS TABLE usuarios;

-- Crea tablas
CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  email VARCHAR
);

CREATE TABLE preguntas (
  id SERIAL PRIMARY KEY,
  pregunta VARCHAR NOT NULL,
  respuesta VARCHAR NOT NULL
);

CREATE TABLE respuestas (
  id SERIAL PRIMARY KEY,
  respuesta_usuario VARCHAR,
  usuario_id INT,
  pregunta_id INT
);

-- Crea relaciones

ALTER TABLE respuestas
ADD CONSTRAINT fk_usuario
FOREIGN KEY (usuario_id)
  REFERENCES usuarios (id)
  ON DELETE CASCADE;

ALTER TABLE respuestas
ADD CONSTRAINT fk_pregunta
FOREIGN KEY (pregunta_id)
  REFERENCES preguntas(id)
  ON DELETE CASCADE;

-- Inserta usuarios
INSERT INTO usuarios (nombre, email) VALUES
('Juan Perez', 'juan.perez@example.com'),
('Maria Garcia', 'maria.garcia@example.com'),
('Carlos Lopez', 'carlos.lopez@example.com'),
('Ana Martinez', 'ana.martinez@example.com'),
('Luis Hernandez', 'luis.hernandez@example.com'),
('Laura Rodriguez', 'laura.rodriguez@example.com'),
('Jorge Sanchez', 'jorge.sanchez@example.com'),
('Elena Fernandez', 'elena.fernandez@example.com'),
('Pablo Diaz', 'pablo.diaz@example.com'),
('Sofia Torres', 'sofia.torres@example.com');

INSERT INTO preguntas (pregunta, respuesta) VALUES
('¿De qué color es el caballo blanco de napoleón?', 'Blanco'),
('¿Cómo se compone químicamente el agua?', 'H2O'),
('¿Cual es el sistema operativo inventado por Linus Torvalds?', 'Linux'),
('¿Qué instrumento tocaba Luis Armstrong?', 'Trompeta'),
('¿Quién era el baterísta de The Beatles?', 'Ringo Star'),
('¿Quién era el guitarrista de Queen?', 'Bryan May'),
('¿Tangananica o tangananá?', 'Tangananica'),
('¿Personaje de 31 minutos que hacía la nota verde?', 'Juan Carlos Bodoque'),
('¿Caballo favorito de Juan Carlos Bodoque?', 'Tormenta China'),
('¿Quién fue el científico que decifró la máquina enigma?', 'Alan Turing');

-- Inserta respuestas
INSERT INTO respuestas (respuesta_usuario, usuario_id, pregunta_id) VALUES
('Blanco', 1, 1), -- Correcta
('Negro', 7, 1), -- Incorrecta
('H2O', 2, 2), -- Correcta
('Agua', 8, 2), -- Incorrecta
('Linux', 3, 3), -- Correcta
('Windows', 1, 3), -- Incorrecta
('Trompeta', 4, 4), -- Correcta
('Saxofón', 10, 4), -- Incorrecta
('Ringo Star', 5, 5), -- Correcta
('John Lennon', 4, 5), -- Incorrecta
('Bryan May', 6, 6), -- Correcta
('Freddie Mercury', 9, 6), -- Incorrecta
('Tangananá', 7, 7), -- Incorrecta
('Tangananica', 8, 7), -- Correcta
('Juan Carlos Bodoque', 8, 8), -- Correcta
('Bodoque Verde', 1, 8), -- Incorrecta
('Relámpago Azul', 3, 9), -- Incorrecta
('Alan Turing', 10, 10), -- Correcta
('Alan Turing', 1, 10), -- Correcta
('Alan Turing', 4, 10), -- Correcta
('Alan Turing', 7, 10), -- Correcta
('Tormenta China', 9, 9), -- Correcta
('Albert Einstein', 1, 10); -- Incorrecta