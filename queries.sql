-- ==========================================
-- PROYECTO: ANÁLISIS DE SOPORTE TÉCNICO
-- ARCHIVO: Consultas de Análisis (Queries)
-- ==========================================

USE soporte_tickets;

-- 1. REPORTE DE RENDIMIENTO Y SLAS POR AGENTE
-- Objetivo: Identificar qué agentes resuelven más tickets y cuántos rompen el SLA (más de 2 días).
SELECT 
    a.nombre AS Agente,
    a.nivel AS Nivel,
    COUNT(*) AS Total_Resueltos,
    SUM(CASE WHEN DATEDIFF(t.fecha_resolucion, t.fecha_creacion) > 2 THEN 1 ELSE 0 END) AS SLA_Incumplidos
FROM tickets t
INNER JOIN agentes a ON t.agente_id = a.id
WHERE t.fecha_resolucion IS NOT NULL
GROUP BY a.nombre, a.nivel
ORDER BY SLA_Incumplidos DESC;

-- 2. PROMEDIO DE DÍAS DE RESOLUCIÓN POR CATEGORÍA
-- Objetivo: Detectar cuellos de botella (qué áreas tardan más en resolverse).
SELECT 
    c.nombre AS Categoria,
    c.area AS Area,
    ROUND(AVG(DATEDIFF(t.fecha_resolucion, t.fecha_creacion)), 1) AS Promedio_Dias
FROM tickets t
INNER JOIN categorias c ON t.categoria_id = c.id
WHERE t.fecha_resolucion IS NOT NULL
GROUP BY c.nombre, c.area
ORDER BY Promedio_Dias DESC;

-- 3. CLASIFICACIÓN DE DESEMPEÑO (SUBCONSULTA)
-- Objetivo: Evaluar a los agentes (Excelente, Aceptable, A Mejorar) basado en sus incumplimientos de SLA.
SELECT 
    nombre,
    total_tickets,
    CASE 
        WHEN sla_incumplidos = 0 THEN 'Excelente'
        WHEN sla_incumplidos BETWEEN 1 AND 2 THEN 'Aceptable'
        ELSE 'A Mejorar'
    END AS Desempeño
FROM (
    SELECT 
        a.nombre,
        COUNT(*) AS total_tickets,
        SUM(CASE WHEN DATEDIFF(t.fecha_resolucion, t.fecha_creacion) > 2 THEN 1 ELSE 0 END) AS sla_incumplidos
    FROM tickets t
    INNER JOIN agentes a ON t.agente_id = a.id
    WHERE t.fecha_resolucion IS NOT NULL
    GROUP BY a.nombre
) AS rendimiento_agentes
ORDER BY total_tickets DESC;

-- 4. TICKETS CRÍTICOS SIN RESOLVER (SOPORTE EN VIVO)
-- Objetivo: Lista de prioridad para los agentes (Tickets Alta prioridad que siguen Abiertos).
SELECT 
    t.id AS Ticket,
    u.nombre AS Usuario,
    c.nombre AS Categoria,
    t.estado,
    t.fecha_creacion
FROM tickets t
INNER JOIN usuarios u ON t.usuario_id = u.id
INNER JOIN categorias c ON t.categoria_id = c.id
WHERE t.prioridad = 'Alta' AND t.fecha_resolucion IS NULL
ORDER BY t.fecha_creacion ASC;

-- 5. VOLUMEN DE TRABAJO POR TURNO Y PAÍS
-- Objetivo: Saber en qué turnos y desde qué países llega la mayor carga de tickets.
SELECT 
    a.turno AS Turno,
    u.pais AS Pais,
    COUNT(t.id) AS Cantidad_Tickets
FROM tickets t
INNER JOIN agentes a ON t.agente_id = a.id
INNER JOIN usuarios u ON t.usuario_id = u.id
GROUP BY a.turno, u.pais
ORDER BY Cantidad_Tickets DESC;