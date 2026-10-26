-- ==========================================
-- PROYECTO: ANÁLISIS DE SOPORTE TÉCNICO (SLAS)
-- ARCHIVO: Esquema de Base de Datos y Datos de Prueba
-- ==========================================

CREATE DATABASE IF NOT EXISTS soporte_tickets;
USE soporte_tickets;

-- 1. Crear Tablas
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    area VARCHAR(50)
);

CREATE TABLE agentes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    turno VARCHAR(50),
    nivel VARCHAR(50)
);

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(50),
    plan VARCHAR(50)
);

CREATE TABLE tickets (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER,
    agente_id INTEGER,
    categoria_id INTEGER,
    prioridad VARCHAR(20),
    estado VARCHAR(20),
    fecha_creacion DATE,
    fecha_resolucion DATE
);

-- 2. Insertar Categorías
INSERT INTO categorias (id, nombre, area) VALUES
(1, 'Login', 'Autenticación'),
(2, 'Pagos', 'Facturación'),
(3, 'Playback', 'Streaming'),
(4, 'Cuenta', 'Perfil'),
(5, 'Envíos', 'Logística'),
(6, 'API', 'Desarrollo');

-- 3. Insertar Agentes
INSERT INTO agentes (id, nombre, turno, nivel) VALUES
(101, 'Carlos', 'Mañana', 'Senior'),
(102, 'María', 'Tarde', 'Junior'),
(103, 'Ana', 'Noche', 'Senior'),
(104, 'Pedro', 'Mañana', 'Junior'),
(105, 'Lucía', 'Tarde', 'Senior'),
(106, 'Jorge', 'Noche', 'Junior'),
(107, 'Elena', 'Mañana', 'Senior'),
(108, 'David', 'Tarde', 'Junior'),
(109, 'Carmen', 'Noche', 'Senior'),
(110, 'Raúl', 'Mañana', 'Junior');

-- 4. Insertar Usuarios
INSERT INTO usuarios (id, nombre, pais, plan) VALUES
(1, 'Ana', 'Colombia', 'Premium'), (2, 'Luis', 'México', 'Básico'),
(3, 'Sofía', 'Colombia', 'Premium'), (4, 'Pedro', 'Argentina', 'Básico'),
(5, 'Laura', 'Colombia', 'Premium'), (6, 'Diego', 'Chile', 'Básico'),
(7, 'Valentina', 'Colombia', 'Premium'), (8, 'Andrés', 'Perú', 'Básico'),
(9, 'Camila', 'Colombia', 'Premium'), (10, 'Felipe', 'México', 'Básico'),
(11, 'Daniel', 'España', 'Empresarial'), (12, 'Martina', 'Argentina', 'Premium'),
(13, 'Javier', 'Chile', 'Básico'), (14, 'Paula', 'España', 'Empresarial'),
(15, 'Ricardo', 'México', 'Premium'), (16, 'Elena', 'Colombia', 'Básico'),
(17, 'Gabriel', 'Perú', 'Empresarial'), (18, 'Sara', 'Argentina', 'Premium'),
(19, 'Hugo', 'Chile', 'Básico'), (20, 'Isabel', 'España', 'Premium');

-- 5. Insertar 50 Tickets
INSERT INTO tickets (id, usuario_id, agente_id, categoria_id, prioridad, estado, fecha_creacion, fecha_resolucion) VALUES
(1, 1, 101, 1, 'Alta', 'Resuelto', '2025-01-02', '2025-01-03'),
(2, 2, 102, 2, 'Media', 'Resuelto', '2025-01-03', '2025-01-07'),
(3, 3, 101, 3, 'Baja', 'Resuelto', '2025-01-04', '2025-01-05'),
(4, 4, 103, 4, 'Alta', 'Resuelto', '2025-01-05', '2025-01-09'),
(5, 5, 102, 1, 'Media', 'Resuelto', '2025-01-06', '2025-01-06'),
(6, 6, 101, 2, 'Alta', 'Resuelto', '2025-01-07', '2025-01-10'),
(7, 7, 103, 3, 'Baja', 'Resuelto', '2025-01-08', '2025-01-09'),
(8, 8, 102, 4, 'Media', 'Resuelto', '2025-01-09', '2025-01-13'),
(9, 9, 101, 1, 'Alta', 'Resuelto', '2025-01-10', '2025-01-11'),
(10, 10, 103, 2, 'Media', 'Resuelto', '2025-01-11', '2025-01-15'),
(11, 11, 104, 5, 'Alta', 'Resuelto', '2025-01-12', '2025-01-16'),
(12, 12, 105, 6, 'Media', 'Resuelto', '2025-01-13', '2025-01-14'),
(13, 13, 106, 1, 'Baja', 'Resuelto', '2025-01-14', '2025-01-15'),
(14, 14, 107, 2, 'Alta', 'Resuelto', '2025-01-15', '2025-01-19'),
(15, 15, 108, 3, 'Media', 'Resuelto', '2025-01-16', '2025-01-17'),
(16, 16, 109, 4, 'Baja', 'Resuelto', '2025-01-17', '2025-01-20'),
(17, 17, 110, 5, 'Alta', 'Resuelto', '2025-01-18', '2025-01-21'),
(18, 18, 101, 6, 'Media', 'Resuelto', '2025-01-19', '2025-01-20'),
(19, 19, 102, 1, 'Baja', 'Resuelto', '2025-01-20', '2025-01-24'),
(20, 20, 103, 2, 'Alta', 'Resuelto', '2025-01-21', '2025-01-22'),
(21, 1, 104, 3, 'Media', 'Resuelto', '2025-01-22', '2025-01-25'),
(22, 2, 105, 4, 'Baja', 'Resuelto', '2025-01-23', '2025-01-24'),
(23, 3, 106, 5, 'Alta', 'Resuelto', '2025-01-24', '2025-01-28'),
(24, 4, 107, 6, 'Media', 'Resuelto', '2025-01-25', '2025-01-26'),
(25, 5, 108, 1, 'Baja', 'Resuelto', '2025-01-26', '2025-01-29'),
(26, 6, 109, 2, 'Alta', 'Resuelto', '2025-01-27', '2025-01-28'),
(27, 7, 110, 3, 'Media', 'Resuelto', '2025-01-28', '2025-02-01'),
(28, 8, 101, 4, 'Baja', 'Resuelto', '2025-01-29', '2025-01-30'),
(29, 9, 102, 5, 'Alta', 'Resuelto', '2025-01-30', '2025-02-04'),
(30, 10, 103, 6, 'Media', 'Resuelto', '2025-01-31', '2025-02-01'),
(31, 11, 104, 1, 'Baja', 'Resuelto', '2025-02-01', '2025-02-02'),
(32, 12, 105, 2, 'Alta', 'Resuelto', '2025-02-02', '2025-02-06'),
(33, 13, 106, 3, 'Media', 'Resuelto', '2025-02-03', '2025-02-04'),
(34, 14, 107, 4, 'Baja', 'Resuelto', '2025-02-04', '2025-02-08'),
(35, 15, 108, 5, 'Alta', 'Resuelto', '2025-02-05', '2025-02-06'),
(36, 16, 109, 6, 'Media', 'En progreso', '2025-02-06', NULL),
(37, 17, 110, 1, 'Baja', 'Abierto', '2025-02-07', NULL),
(38, 18, 101, 2, 'Alta', 'En progreso', '2025-02-08', NULL),
(39, 19, 102, 3, 'Media', 'Abierto', '2025-02-09', NULL),
(40, 20, 103, 4, 'Baja', 'En progreso', '2025-02-10', NULL),
(41, 1, 104, 5, 'Alta', 'Abierto', '2025-02-11', NULL),
(42, 2, 105, 6, 'Media', 'En progreso', '2025-02-12', NULL),
(43, 3, 106, 1, 'Baja', 'Abierto', '2025-02-13', NULL),
(44, 4, 107, 2, 'Alta', 'En progreso', '2025-02-14', NULL),
(45, 5, 108, 3, 'Media', 'Abierto', '2025-02-15', NULL),
(46, 6, 109, 4, 'Baja', 'En progreso', '2025-02-16', NULL),
(47, 7, 110, 5, 'Alta', 'Abierto', '2025-02-17', NULL),
(48, 8, 101, 6, 'Media', 'En progreso', '2025-02-18', NULL),
(49, 9, 102, 1, 'Baja', 'Abierto', '2025-02-19', NULL),
(50, 10, 103, 2, 'Alta', 'En progreso', '2025-02-20', NULL);