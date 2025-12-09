🟧 Modelo de Caducidad y Estatus Semanales – Inventarios

Este proyecto muestra la construcción de una vista compleja para análisis de inventarios con fechas de caducidad, integrando múltiples fuentes y cálculos derivados.

Objetivo

Unificar inventarios provenientes de diversas tablas, estandarizar columnas y calcular métricas de vida útil y estatus semanales.

Características principales

🟨 1. Integración de múltiples fuentes
- onn_alp_bi_short_dates
- onn_alp_bi_existence_inventory
- onn_alp_bi_csv_ecatepec
- onn_alp_bi_organization
- onn_alp_bi_batch

Mediante UNION ALL, estandarizando columnas con NULL AS columnaX cuando aplica.

🟩 2. Cálculo de métricas derivadas

- DAYS_OF_LIFE
- STATUS (basado en días a vencer)
- TARIMAS, CAJAS_SOBRANTES, PIEZAS_SUELTAS
- Columnas calculadas de negocio (CATEGORIA, ACCIONABLE)

🟦 3. Estatus semanales W1–W5

Lógica con CASE WHEN:
- W1_ESTATUS
- W2_ESTATUS
- W3_ESTATUS
- W4_ESTATUS
- W5_ESTATUS

Basado en fecha actual y fecha de caducidad.

🟥 4. Estandarización de columnas

Para permitir UNION ALL limpio:

- Conversión de tipos
- Columnas agregadas con NULL
- Renombrado consistente
- Orden de columnas idéntico

🟫 5. Ejemplo simplificado
(Soon: agregaremos SQL real aquí)
- Tecnologías
- SQL

Databricks

Delta Lake
