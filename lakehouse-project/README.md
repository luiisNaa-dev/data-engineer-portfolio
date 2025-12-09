🟩 Mini Lakehouse – Inventarios (Databricks / Delta Lake)

Este proyecto demuestra la construcción de un pipeline estilo medallón (Bronze → Silver → Gold) usando Databricks y Delta Lake.

Bronze
- Ingesta de archivos CSV/JSON.
- Estandarización básica de tipos.
- Control de duplicados a nivel archivo.

Silver
- Limpieza de datos.
- Estandarización de nombres de columnas.
- Dedupe con ROW_NUMBER() y claves compuestas.

Gold
Cálculo de métricas derivadas:
- DAYS_OF_LIFE
- STATUS
- TARIMAS / CAJAS_SOBRANTES
Integración de varias fuentes (al estilo de tu proyecto de Alpura).
MERGE transaccional con created_date y updated_date.

Tecnologías

- Databricks
- Delta Lake
- PySpark
- SQL
