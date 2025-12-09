-- Ejemplo simplificado de integración de inventarios con cálculo de caducidad

WITH base AS (
    SELECT
        item,
        batch,
        expiration_date,
        quantity,
        CURRENT_DATE() AS process_date,
        DATE_DIFF(expiration_date, CURRENT_DATE()) AS days_of_life
    FROM inventory_source
)

SELECT
    *,
    CASE
        WHEN days_of_life < 0 THEN 'Vencido'
        WHEN days_of_life BETWEEN 0 AND 7 THEN 'W1'
        WHEN days_of_life BETWEEN 8 AND 14 THEN 'W2'
        WHEN days_of_life BETWEEN 15 AND 21 THEN 'W3'
        ELSE 'W4+'
    END AS status_week
FROM base;
