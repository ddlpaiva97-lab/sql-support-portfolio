-- ==========================================
-- PROYECTO: ANÁLISIS DE SOPORTE TÉCNICO
-- ARCHIVO: Operaciones DML (Creación y Modificación)
-- ==========================================

USE soporte_tickets;

-- 1. CREACIÓN DE UNA NUEVA TABLA
-- Creamos una tabla para gestionar los equipos de soporte (Alfa, Beta, etc.)
CREATE TABLE equipos_soporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(50),
    lider VARCHAR(50),
    fecha_creacion DATE
);

-- 2. INSERCIÓN DE DATOS (INSERT)
-- Insertamos dos equipos nuevos. El ID se genera automáticamente.
INSERT INTO equipos_soporte (nombre_equipo, lider, fecha_creacion) 
VALUES ('Alfa', 'Carlos', '2025-01-01');

INSERT INTO equipos_soporte (nombre_equipo, lider, fecha_creacion) 
VALUES ('Beta', 'Ana', '2025-02-01');

-- 3. ACTUALIZACIÓN DE DATOS (UPDATE)
-- El líder del equipo Alfa cambió. Actualizamos su registro.
UPDATE equipos_soporte
SET lider = 'María'
WHERE nombre_equipo = 'Alfa';

-- 4. ELIMINACIÓN DE DATOS (DELETE)
-- El equipo Beta se disolvió. Borramos su registro.
DELETE FROM equipos_soporte
WHERE nombre_equipo = 'Beta';

-- 5. CONSULTA FINAL
-- Verificamos que solo quede el equipo Alfa con su nuevo líder.
SELECT * FROM equipos_soporte;