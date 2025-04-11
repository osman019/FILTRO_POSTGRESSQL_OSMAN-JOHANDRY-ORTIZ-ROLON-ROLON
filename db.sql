
CREATE DATABASE "TechZone"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es-ES'
    LC_CTYPE = 'es-ES'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


\c TechZone;


CREATE SEQUENCE clientes_id_seq START 1;

CREATE TABLE IF NOT EXISTS clientes
(
    id integer NOT NULL DEFAULT nextval('clientes_id_seq'::regclass),
    nombre character varying COLLATE pg_catalog."default",
    correo character varying COLLATE pg_catalog."default",
    telefono integer,
    CONSTRAINT clientes_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS clientes
    OWNER to postgres;


CREATE SEQUENCE categorias_productos_id_seq START 1;


CREATE TABLE IF NOT EXISTS categorias_productos
(
    id integer NOT NULL DEFAULT nextval('categorias_productos_id_seq'::regclass),
    nombre character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT categorias_productos_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS categorias_productos
    OWNER to postgres;


CREATE SEQUENCE productos_id_seq START 1;


CREATE TABLE IF NOT EXISTS productos
(
    id integer NOT NULL DEFAULT nextval('productos_id_seq'::regclass),
    nombre character varying(50) COLLATE pg_catalog."default",
    categoria_id integer,
    precio money,
    stock integer,
    proveedor_id integer,
    CONSTRAINT productos_pkey PRIMARY KEY (id),
    CONSTRAINT fk_categoriaid FOREIGN KEY (categoria_id)
        REFERENCES public.categorias_productos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS productos
    OWNER to postgres;


CREATE SEQUENCE proveedores_id_seq START 1;


CREATE TABLE IF NOT EXISTS proveedores
(
    id integer NOT NULL DEFAULT nextval('proveedores_id_seq'::regclass),
    nombre character varying(50) COLLATE pg_catalog."default",
    correo character varying(50) COLLATE pg_catalog."default",
    categoria_id integer,
    CONSTRAINT proveedores_pkey PRIMARY KEY (id),
    CONSTRAINT fk_categoriaid FOREIGN KEY (categoria_id)
        REFERENCES public.categorias_productos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS proveedores
    OWNER to postgres;


CREATE SEQUENCE ventas_id_seq START 1;


CREATE TABLE IF NOT EXISTS ventas
(
    id integer NOT NULL DEFAULT nextval('ventas_id_seq'::regclass),
    productos_id integer,
    cantidad_vendida integer,
    cliente_id integer,
    total_venta double precision,
    fecha date,
    CONSTRAINT ventas_pkey PRIMARY KEY (id),
    CONSTRAINT fk_clienteid FOREIGN KEY (cliente_id)
        REFERENCES public.clientes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_productoid FOREIGN KEY (productos_id)
        REFERENCES public.productos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS ventas
    OWNER to postgres;
