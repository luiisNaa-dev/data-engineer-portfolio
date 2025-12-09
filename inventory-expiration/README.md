## Modelo de Caducidad y Estatus Semanales – Inventarios

Este proyecto representa un caso real de análisis de inventarios con fechas de caducidad.  
La idea es unificar datos provenientes de varias fuentes, estandarizar columnas y calcular métricas clave para identificar riesgos de producto próximo a vencer.

---

### 🟠 1. Integración de múltiples fuentes (UNION ALL)
El modelo combina inventarios de diferentes tablas y sistemas, aplicando:

- `UNION ALL` entre estructuras distintas.
- Columnas alineadas (uso de `NULL AS columnaX` cuando una fuente no tiene ciertos campos).
- Tipos de datos estandarizados.

---

### 🟡 2. Cálculo de métricas derivadas
El proyecto incluye cálculos como:

- **DAYS_OF_LIFE**: días restantes antes de caducar.  
- **STATUS**: clasificación por días a vencer (Vencido, Próximo, etc.).  
- **TARIMAS**, **CAJAS_SOBRANTES**, **PIEZAS_SUELTAS**.  
- **CATEGORIA** y **ACCIONABLE** según reglas de negocio.

---

### 🟢 3. Estatus Semanales W1–W5
Lógica simplificada usando `CASE WHEN`:

- W1: 0–7 días  
- W2: 8–14 días  
- W3: 15–21 días  
- W4: 22–28 días  
- W5: >28 días  

Esto ayuda a visualizar riesgos a corto y mediano plazo.

---

### 🔵 4. Estandarización de columnas
Para permitir un `UNION ALL` limpio:

- Columnas ordenadas en la misma secuencia.  
- Tipos homogéneos (ints, strings, dates).  
- Campos faltantes representados como `NULL`.  

---

### 🟣 5. Ejemplo de SQL (versión simplificada)
Ver archivo: `inventory-expiration/example_inventory_sql.sql` (por crear).

---

### Tecnologías usadas
- SQL  
- Databricks  
- Delta Lake  
