--Entrega M5. Consultas con JOINs para el proyecto
--Consulta 1 - Vista base del proyecto (INNER JOIN)

USE Ventas_Tech_DB;

SELECT
    v.Fecha_venta,
    v.Id_cliente,
    c.Nombre AS Nombre_cliente,
    c.Email,
    c.Ciudad,
    v.Id_producto,
    p.Nombre_producto,
    cat.Nombre_categoria,
    v.Cantidad,
    v.Precio_unitario,
    v.Cantidad * v.Precio_unitario AS Total_venta
FROM Ventas AS v
INNER JOIN Clientes AS c
    ON v.Id_cliente = c.Id_cliente
INNER JOIN Productos AS p
    ON v.Id_producto = p.Id_producto
INNER JOIN Categorias AS cat
    ON p.Id_categoria = cat.Id_categoria;


--Consulta 2 — Clientes sin ventas (LEFT JOIN)
SELECT
    c.Nombre,
    c.Email,
    c.Fecha_registro
FROM Clientes AS c
LEFT JOIN Ventas AS v
    ON c.Id_cliente = v.Id_cliente
WHERE v.Id_venta IS NULL;


--Consulta 3 — Productos sin ventas (LEFT JOIN)
SELECT
    p.Nombre_producto,
    cat.Nombre_categoria,
    p.Precio
FROM Productos AS p
LEFT JOIN Ventas AS v
    ON p.Id_producto = v.Id_producto
INNER JOIN Categorias AS cat
    ON p.Id_categoria = cat.Id_categoria
WHERE v.Id_venta IS NULL;

--Consulta 4 — Consolidado por canal (UNION ALL)
--Escenario planteado a los efectos prácticos de la consigna:
-- Entre el 01/03/2024 y el 10/03/2024 la tienda online
-- sufrió una interrupción temporal por un inconveniente técnico,
-- por lo que las ventas se realizaron de forma presencial.
-- A partir del 11/03/2024 el canal online volvió a estar operativo.
-- Por tal motivo, se clasifican las ventas de la siguiente manera:
-- 01/03/2024 al 10/03/2024 → Presencial
-- 11/03/2024 al 15/03/2024 → Online

SELECT
    Canal,
    SUM(Total_venta) AS Total_por_canal
FROM (
    SELECT
        Fecha_venta,
        Cantidad * Precio_unitario AS Total_venta,
        'Presencial' AS Canal
    FROM Ventas
    WHERE Fecha_venta BETWEEN '2024-03-01' AND '2024-03-10'

    UNION ALL

    SELECT
        Fecha_venta,
        Cantidad * Precio_unitario AS Total_venta,
        'Online' AS Canal
    FROM Ventas
    WHERE Fecha_venta BETWEEN '2024-03-11' AND '2024-03-15'
) AS Ventas_por_canal
GROUP BY Canal;


--Consultas auxiliares/de verificación de la Consulta 4

--Ventas presenciales del 01/03/2024 al 10/03/2024
SELECT
    Fecha_venta,
    Cantidad * Precio_unitario AS Total_venta,
    'Presencial' AS Canal
FROM Ventas
WHERE Fecha_venta BETWEEN '2024-03-01' AND '2024-03-10';

--Ventas Online del 11/03/2024 al 15/03/2024
SELECT
    Fecha_venta,
    Cantidad * Precio_unitario AS Total_venta,
    'Online' AS Canal
FROM Ventas
WHERE Fecha_venta BETWEEN '2024-03-11' AND '2024-03-15';

--Unión de ambas consultas: Ventas presencial y Online
SELECT
    Fecha_venta,
    Cantidad * Precio_unitario AS Total_venta,
    'Presencial' AS Canal
FROM Ventas
WHERE Fecha_venta BETWEEN '2024-03-01' AND '2024-03-10'
UNION ALL
SELECT
    Fecha_venta,
    Cantidad * Precio_unitario AS Total_venta,
    'Online' AS Canal
FROM Ventas
WHERE Fecha_venta BETWEEN '2024-03-11' AND '2024-03-15';