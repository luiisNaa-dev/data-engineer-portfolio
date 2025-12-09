-- MERGE transaccional (Upsert)
-- Caso típico en Delta Lake / BigQuery para mantener tabla histórica actualizada

MERGE INTO target_table AS t
USING staging_table AS s
ON t.ID_FACT = s.ID_FACT

WHEN MATCHED THEN 
  UPDATE SET
      t.field1 = s.field1,
      t.field2 = s.field2,
      t.field3 = s.field3,
      t.updated_date = current_timestamp()

WHEN NOT MATCHED THEN
  INSERT (
      ID_FACT,
      field1,
      field2,
      field3,
      created_date,
      updated_date
  )
  VALUES (
      s.ID_FACT,
      s.field1,
      s.field2,
      s.field3,
      current_timestamp(),
      current_timestamp()
  );
