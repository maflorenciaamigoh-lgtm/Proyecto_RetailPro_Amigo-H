# RetailPro:  Empresa distribuidora de tecnología 
Definición del problema de negocio 
¿Qué  categorías  de  productos  presentan  el  mejor  desempeño  actual  y  mayores 
oportunidades  de  crecimiento,  y  deberían  ser  consideradas  prioritarias  en  la  estrategia 
comercial de RetailPro? 




Entrega 8 — Modelo de datos y medidas DAX
En esta entrega se completó el modelo analítico en Power BI a partir del archivo trabajado en el módulo anterior.

Se estructuró el modelo en esquema estrella, utilizando Fact_Ventas como tabla de hechos y las dimensiones de clientes, productos, categorías y fechas.
Se configuraron las relaciones 1:N, activas y con filtro único.
Se creó y configuró Dim_Fechas como tabla calendario, incluyendo los campos necesarios para el análisis temporal y el orden correcto de los meses.
Se creó _Medidas como tabla independiente para centralizar las medidas DAX.
Se incorporaron y validaron las cinco medidas requeridas, incluyendo inteligencia temporal, VAR y DIVIDE.
Se creó una página de Validación y se comprobó que los resultados de las medidas se comportan correctamente según los distintos períodos analizados.
Se conservó F_ventas_inicial como consulta auxiliar, ya que Fact_Ventas depende de ella dentro de Power Query.
