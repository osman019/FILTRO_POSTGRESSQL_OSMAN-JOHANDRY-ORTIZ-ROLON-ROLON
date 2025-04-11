INSERT INTO clientes(nombre,correo,telefono) VALUES ('osman','osman@gmail.com',112345);      
INSERT INTO clientes(nombre,correo,telefono) VALUES ('maria','maria@gmail.com',131454);
INSERT INTO clientes(nombre,correo,telefono) VALUES ('jorman','jorman@gmail.com',91455);   
INSERT INTO clientes(nombre,correo,telefono) VALUES ('stiven','stiven@gmail.com',78954);    
INSERT INTO clientes(nombre,correo,telefono) VALUES ('paola','paola@gmail.com',48965);  
INSERT INTO clientes(nombre,correo,telefono) VALUES ('paula','paula@gmail.com',78459);  
INSERT INTO clientes(nombre,correo,telefono) VALUES ('michel','michel@gmail.com',45256); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('tabares','tabares@gmail.com',78032); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('lisec','liset@gmail.com',159765); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('lopez','lopez@gmail.com',78458); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('mursia','mursia@gmail.com',10236); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('fabian','fabian@gmail.com',456987); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('kira','kira@gmail.com',124503); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('gracias','gracias@gmail.com',101023); 
INSERT INTO clientes(nombre,correo,telefono) VALUES ('mira','mira@gmail.com',789898); 

INSERT INTO categorias_productos(nombre) VALUES ('laptos'); 
INSERT INTO categorias_productos(nombre) VALUES ('teléfonos'); 
INSERT INTO categorias_productos(nombre) VALUES ('accesorios'); 
INSERT INTO categorias_productos(nombre) VALUES ('componentes electrónicos'); 

INSERT INTO proveedores(nombre,correo,categoria_id) VALUES ('nantes','nantes@gmail.com',1); 
INSERT INTO proveedores(nombre,correo,categoria_id) VALUES ('raul','raul@gmail.com',2); 
INSERT INTO proveedores(nombre,correo,categoria_id) VALUES ('garcia','garcia@gmail.com',3);
INSERT INTO proveedores(nombre,correo,categoria_id) VALUES ('fabiola','fabiola@gmail.com',4);

INSERT INTO productos(nombre,categoria_id,precio,stock,proveedor_id) VALUES ('hp',1,10.000,10,1); 
INSERT INTO productos(nombre,categoria_id,precio,stock,proveedor_id) VALUES ('Samsumg',2,200.000,10,2); 
INSERT INTO productos(nombre,categoria_id,precio,stock,proveedor_id) VALUES ('forro',3,20.000,10,3);
INSERT INTO productos(nombre,categoria_id,precio,stock,proveedor_id) VALUES ('pantalla samsumg',4,400.000,10,4);
INSERT INTO productos(nombre,categoria_id,precio,stock,proveedor_id) VALUES ('pantalla lg',4,400.000,2,4);

INSERT INTO ventas(productos_id, cantidad_vendida,cliente_id,total_venta,fecha) VALUES (1,10,1,2000000,'2025-02-10'); 
INSERT INTO ventas(productos_id, cantidad_vendida,cliente_id,total_venta,fecha) VALUES (2,5,2,600000,'2024-01-10'); 
INSERT INTO ventas(productos_id, cantidad_vendida,cliente_id,total_venta,fecha) VALUES (3,9,3,400000,'2023-02-20'); 
INSERT INTO ventas(productos_id, cantidad_vendida,cliente_id,total_venta,fecha) VALUES (4,9,4,800000,'2024-06-30'); 