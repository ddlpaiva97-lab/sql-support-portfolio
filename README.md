# 📊 Análisis de Soporte Técnico y SLAs (Portafolio SQL)

Este proyecto simula una base de datos relacional de un Centro de Soporte (Helpdesk). El objetivo principal es demostrar habilidades avanzadas de consulta en SQL para el rol de **Technical Support / Application Support Specialist**.

El análisis se enfoca en diagnosticar el rendimiento de los agentes, medir el cumplimiento de los Acuerdos de Nivel de Servicio (SLAs) y priorizar la resolución de tickets críticos.

## 🛠️ Tecnologías y Habilidades Utilizadas
* **Motor de Base de Datos:** MySQL / MySQL Workbench
* **Habilidades SQL:**
  * `JOINs` (INNER JOIN para unir hasta 3 tablas).
  * `GROUP BY` y `HAVING` (Agrupación y filtrado de datos).
  * `CASE WHEN` (Lógica condicional para categorizar datos).
  * `DATEDIFF` (Cálculo de tiempos de resolución en días).
  * **Subconsultas** (Para clasificar el desempeño de los agentes).
  * Funciones de agregación (`COUNT`, `SUM`, `AVG`, `ROUND`).

## 📂 Estructura del Repositorio
* `schema.sql`: Contiene la creación de las 4 tablas relacionales (tickets, usuarios, agentes, categorias) y la inserción de 50 tickets de prueba con datos realistas.
* `queries.sql`: Contiene las 5 consultas de análisis de negocio documentadas.

## 📈 Consultas Destacadas (Resultados Esperados)

1. **Rendimiento por Agente:** Identifica el volumen de tickets resueltos y las violaciones de SLA por cada agente (útil para KPIs de rendimiento).
2. **Promedio de Resolución por Categoría:** Calcula el tiempo promedio de resolución por área (Login, Pagos, API) para detectar cuellos de botella.
3. **Clasificación con Subconsultas:** Evalúa el desempeño del agente (Excelente, Aceptable, A Mejorar) basado en sus incumplimientos usando subconsultas anidadas.
4. **Tickets Críticos:** Filtra los tickets de alta prioridad que aún no se han resuelto, ideal para priorizar el trabajo diario en el equipo de soporte.
5. **Volumen por Turno y País:** Analiza desde qué regiones y en qué turnos se concentra la mayor cantidad de reportes.
