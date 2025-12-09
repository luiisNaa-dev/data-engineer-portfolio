# Ejemplo simplificado de procesamiento PySpark estilo Silver Layer

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, trim, upper, row_number
from pyspark.sql.window import Window

spark = SparkSession.builder.getOrCreate()

# Bronze → lectura
df_bronze = spark.read.format("delta").load("/mnt/bronze/inventory")

# Limpieza básica
df_clean = (
    df_bronze
    .withColumn("item", trim(upper(col("item"))))
    .withColumn("quantity", col("quantity").cast("int"))
)

# Dedupe usando Window Function
window_spec = Window.partitionBy("item", "batch").orderBy(col("updated_at").desc())

df_dedupe = (
    df_clean
    .withColumn("rn", row_number().over(window_spec))
    .filter(col("rn") == 1)
)

# Escritura Silver
df_dedupe.write.format("delta").mode("overwrite").save("/mnt/silver/inventory")
