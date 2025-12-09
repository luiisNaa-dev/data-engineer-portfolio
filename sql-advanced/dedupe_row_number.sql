WITH base AS (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY
                t.business_key       -- reemplazar por la llave de negocio (ej. ID_ITEM, ID_FACT, etc.)
            ORDER BY
                t.updated_at DESC    -- criterio para decidir cuál es la "mejor" fila
        ) AS rn
    FROM raw_table t                  -- reemplazar por el nombre de tu tabla fuente
)

SELECT *
FROM base
WHERE rn = 1;
