-- Cálculo de estatus semanal basado en fecha de caducidad

SELECT
    item,
    expiration_date,
    CURRENT_DATE() AS process_date,
    
    CASE 
        WHEN expiration_date <= CURRENT_DATE() THEN 'Vencido'
        WHEN expiration_date BETWEEN CURRENT_DATE() AND DATE_ADD(CURRENT_DATE(), 7) THEN 'W1'
        WHEN expiration_date BETWEEN DATE_ADD(CURRENT_DATE(), 8) AND DATE_ADD(CURRENT_DATE(), 14) THEN 'W2'
        WHEN expiration_date BETWEEN DATE_ADD(CURRENT_DATE(), 15) AND DATE_ADD(CURRENT_DATE(), 21) THEN 'W3'
        ELSE 'W4+'
    END AS status_semana

FROM inventory_table;
