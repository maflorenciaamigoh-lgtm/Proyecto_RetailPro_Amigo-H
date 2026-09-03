
USE Ventas_Tech_DB;

--Consulta 1 — Resumen ejecutivo mensual
--Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes.
SELECT
MONTH(Fecha_venta) AS Mes,
SUM(Cantidad*Precio_unitario) AS Total_facturado,
COUNT(Id_venta) AS Cantidad_pedidos,
AVG(Cantidad*Precio_unitario) AS Ticket_promedio
FROM Ventas
GROUP BY MONTH(Fecha_venta);

--Consulta 2 — Ranking de productos - Top 5
SELECT TOP 5
    Id_producto,
    SUM(Cantidad) AS Unidades_vendidas,
    SUM(Cantidad * Precio_unitario) AS Total_generado
FROM Ventas
GROUP BY Id_producto
ORDER BY Total_generado DESC;

--Consulta 3 — Clientes recurrentes
SELECT
Id_cliente,
COUNT(*) AS Cantidad_pedidos,
SUM(Cantidad*Precio_unitario) AS Total_gastado
FROM Ventas
GROUP BY Id_cliente
HAVING COUNT(*) > 1;

--Consulta 4 — Meses por encima/por debajo del promedio
SELECT
    Mes,
    Total_facturado,
    CASE
        WHEN Total_facturado > Promedio_mensual THEN 'Por encima'
        WHEN Total_facturado < Promedio_mensual THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS Comparacion
FROM (
    SELECT
        MONTH(Fecha_venta) AS Mes,
        SUM(Cantidad*Precio_unitario) AS Total_facturado,
        AVG(SUM(Cantidad*Precio_unitario)) OVER () AS Promedio_mensual
    FROM Ventas
    GROUP BY MONTH(Fecha_venta)
) AS Resumen_mensual;

--Comentarios / Hallazgos
--1. El producto 1 fue el que más facturó, concentrando aproximadamente el 56% de la facturación mensual.
--2. El producto 2 fue el que más unidades vendió, pero aportó solo un 6% de la facturación mensual. Esto demuestra que vender más unidades no necesariamente implica una mayor facturación.
--3. El 100% de las ventas fueron realizadas por clientes recurrentes, ya que los 5 clientes registrados realizaron 2 pedidos cada uno durante el período analizado.

