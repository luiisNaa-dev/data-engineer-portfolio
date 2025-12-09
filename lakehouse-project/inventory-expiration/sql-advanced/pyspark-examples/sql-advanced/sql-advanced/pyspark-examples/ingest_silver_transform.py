# Ejemplo simplificado de procesamiento PySpark estilo Silver Layer
# Enfoque: lectura desde Bronze, limpieza básica y escritura en Silver.

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, trim, upper

spark = SparkSession.builder.getOrCreate()

# Lectura desde Bronze (ejemplo de ruta)
df_bronze = (
    spark.read
    .format("delta")
    .load("/mnt/bronze/inventory")
)

# Limpieza básica de datos
df_silver = (
    df_bronze
    # Estandarización de texto
    .withColumn("item", trim(upper(col("item"))))
    # Conversión de tipos
    .withColumn("quantity", col("quantity").cast("int"))
    # Filtro de registros inválidos
    .filter(col("quantity").isNotNull())
)

# Escritura en Silver
df_silver.write.format("delta").mode("overwrite").save("/mnt/silver/inventory")
