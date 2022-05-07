# -- Table: public.customers

# -- DROP TABLE IF EXISTS public.customers;

CREATE TABLE IF NOT EXISTS public.customers
(
    customer_id integer NOT NULL,
    name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    street_address character varying(256) COLLATE pg_catalog."default" NOT NULL,
    city character varying(64) COLLATE pg_catalog."default" NOT NULL,
    state character varying(32) COLLATE pg_catalog."default" NOT NULL,
    zip character varying(16) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;



# -- Table: public.manufacturers

# -- DROP TABLE IF EXISTS public.manufacturers;

CREATE TABLE IF NOT EXISTS public.manufacturers
(
    designer_id integer NOT NULL,
    name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    street_address character varying(256) COLLATE pg_catalog."default" NOT NULL,
    city character varying(64) COLLATE pg_catalog."default" NOT NULL,
    state character varying(32) COLLATE pg_catalog."default" NOT NULL,
    zip character varying(16) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT manufacturers_pkey PRIMARY KEY (designer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.manufacturers
    OWNER to postgres;


# -- Table: public.parts

# -- DROP TABLE IF EXISTS public.parts;

CREATE TABLE IF NOT EXISTS public.parts
(
    part_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    designer_id integer NOT NULL,
    CONSTRAINT parts_pkey PRIMARY KEY (part_id),
    CONSTRAINT manufacturer_id FOREIGN KEY (manufacturer_id)
        REFERENCES public.parts (part_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.parts
    OWNER to postgres;
-- Index: fki_manufacturer_id

-- DROP INDEX IF EXISTS public.fki_manufacturer_id;

CREATE INDEX IF NOT EXISTS fki_manufacturer_id
    ON public.parts USING btree
    (manufacturer_id ASC NULLS LAST)
    TABLESPACE pg_default;




# -- Table: public.orders

# -- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer NOT NULL,
    part_id integer NOT NULL,
    customer_id integer NOT NULL,
    quantity integer NOT NULL,
    repeat_no integer NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT customer_id FOREIGN KEY (customer_id)
        REFERENCES public.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT part_id FOREIGN KEY (part_id)
        REFERENCES public.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;
-- Index: fki_customer_id

-- DROP INDEX IF EXISTS public.fki_customer_id;

CREATE INDEX IF NOT EXISTS fki_customer_id
    ON public.orders USING btree
    (customer_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_part_id

-- DROP INDEX IF EXISTS public.fki_part_id;

CREATE INDEX IF NOT EXISTS fki_part_id
    ON public.orders USING btree
    (part_id ASC NULLS LAST)
    TABLESPACE pg_default;