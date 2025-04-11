/*5. Procedimientos y Funciones*/ 


CREATE OR REPLACE FUNCTION registrar_venta(
    p_cliente_id INTEGER,
    p_producto_id INTEGER,
    p_cantidad INTEGER,
    p_total_venta DOUBLE PRECISION,
    p_fecha DATE
)
RETURNS VOID AS $$
DECLARE
    v_stock_actual INTEGER;
    v_cliente_existente BOOLEAN;
BEGIN

    SELECT EXISTS (SELECT 1 FROM clientes WHERE id = p_cliente_id) INTO v_cliente_existente;
    
    IF NOT v_cliente_existente THEN
        RAISE EXCEPTION 'El cliente con ID % no existe.', p_cliente_id;
    END IF;


    SELECT stock INTO v_stock_actual
    FROM productos
    WHERE id = p_producto_id;

   
    IF v_stock_actual < p_cantidad THEN
        RAISE EXCEPTION 'No hay suficiente stock para el producto con ID % (Stock actual: %, solicitado: %).', p_producto_id, v_stock_actual, p_cantidad;
    END IF;

  
    INSERT INTO ventas (productos_id, cantidad_vendida, cliente_id, total_venta, fecha)
    VALUES (p_producto_id, p_cantidad, p_cliente_id, p_total_venta, p_fecha);

    
    UPDATE productos
    SET stock = stock - p_cantidad
    WHERE id = p_producto_id;

    RAISE NOTICE 'Venta registrada con exito para el cliente % (Producto ID: %, Cantidad: %, Total: %, Fecha: %).',
        p_cliente_id, p_producto_id, p_cantidad, p_total_venta, p_fecha;

END;
$$ LANGUAGE plpgsql;

SELECT registrar_venta(1, 1, 3, 150.00, '2025-04-11');
