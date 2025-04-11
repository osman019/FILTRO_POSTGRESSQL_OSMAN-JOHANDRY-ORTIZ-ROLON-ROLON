
/*1️ Listar los productos con stock menor a 5 unidades.*/
SELECT nombre, stock
FROM productos
WHERE stock < 5;

/*2 Calcular ventas totales de un mes específico.*/
SELECT SUM(total_venta) AS ventas_totales
FROM public.ventas
WHERE EXTRACT(MONTH FROM fecha) = 2
  AND EXTRACT(YEAR FROM fecha) = 2025;

/*3 Obtener el cliente con más compras realizadas.*/
SELECT c.nombre, COUNT(v.id) AS total_compras
FROM clientes c
JOIN public.ventas v ON c.id = v.cliente_id
GROUP BY c.id
ORDER BY total_compras DESC
LIMIT 1;

/* 4 Listar los 5 productos más vendidos.*/
SELECT p.nombre, SUM(v.cantidad_vendida) AS total_vendido
FROM productos p
JOIN public.ventas v ON p.id = v.productos_id
GROUP BY p.id
ORDER BY total_vendido DESC
LIMIT 5;

/*5 Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.*/
SELECT v.id, v.fecha, v.total_venta
FROM ventas v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-31';

/*6 Identificar clientes que no han comprado en los últimos 6 meses.*/
SELECT c.nombre, c.correo
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM public.ventas v
    WHERE v.cliente_id = c.id
      AND v.fecha >= CURRENT_DATE - INTERVAL '6 months'
);
