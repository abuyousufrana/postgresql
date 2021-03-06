PGDMP                          z            init    14.2    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    16394    init    DATABASE     h   CREATE DATABASE init WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE init;
                postgres    false            ?            1259    16437 	   customers    TABLE     G  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(128) NOT NULL,
    street_address character varying(256) NOT NULL,
    city character varying(64) NOT NULL,
    state character varying(32) NOT NULL,
    zip character varying(16) NOT NULL,
    phone character varying(16) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            ?            1259    16430    manufacturers    TABLE     K  CREATE TABLE public.manufacturers (
    designer_id integer NOT NULL,
    name character varying(128) NOT NULL,
    street_address character varying(256) NOT NULL,
    city character varying(64) NOT NULL,
    state character varying(32) NOT NULL,
    zip character varying(16) NOT NULL,
    phone character varying(16) NOT NULL
);
 !   DROP TABLE public.manufacturers;
       public         heap    postgres    false            ?            1259    16495    orders    TABLE     ?   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    part_id integer NOT NULL,
    customer_id integer NOT NULL,
    quantity integer NOT NULL,
    repeat_no integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            ?            1259    16465    parts    TABLE     ?   CREATE TABLE public.parts (
    part_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    designer_id integer NOT NULL
);
    DROP TABLE public.parts;
       public         heap    postgres    false                      0    16437 	   customers 
   TABLE DATA           _   COPY public.customers (customer_id, name, street_address, city, state, zip, phone) FROM stdin;
    public          postgres    false    210   ?                  0    16430    manufacturers 
   TABLE DATA           c   COPY public.manufacturers (designer_id, name, street_address, city, state, zip, phone) FROM stdin;
    public          postgres    false    209   ?                 0    16495    orders 
   TABLE DATA           U   COPY public.orders (order_id, part_id, customer_id, quantity, repeat_no) FROM stdin;
    public          postgres    false    212   ?                 0    16465    parts 
   TABLE DATA           Y   COPY public.parts (part_id, manufacturer_id, name, description, designer_id) FROM stdin;
    public          postgres    false    211   ?       j           2606    16443    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    210            h           2606    16436     manufacturers manufacturers_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (designer_id);
 J   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_pkey;
       public            postgres    false    209            q           2606    16499    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    212            m           2606    16471    parts parts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (part_id);
 :   ALTER TABLE ONLY public.parts DROP CONSTRAINT parts_pkey;
       public            postgres    false    211            n           1259    16510    fki_customer_id    INDEX     I   CREATE INDEX fki_customer_id ON public.orders USING btree (customer_id);
 #   DROP INDEX public.fki_customer_id;
       public            postgres    false    212            k           1259    16477    fki_manufacturer_id    INDEX     P   CREATE INDEX fki_manufacturer_id ON public.parts USING btree (manufacturer_id);
 '   DROP INDEX public.fki_manufacturer_id;
       public            postgres    false    211            o           1259    16511    fki_part_id    INDEX     A   CREATE INDEX fki_part_id ON public.orders USING btree (part_id);
    DROP INDEX public.fki_part_id;
       public            postgres    false    212            s           2606    16513    orders customer_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES public.orders(order_id) NOT VALID;
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT customer_id;
       public          postgres    false    212    3185    212            r           2606    16472    parts manufacturer_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.parts(part_id) NOT VALID;
 ?   ALTER TABLE ONLY public.parts DROP CONSTRAINT manufacturer_id;
       public          postgres    false    211    3181    211            t           2606    16518    orders part_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT part_id FOREIGN KEY (part_id) REFERENCES public.orders(order_id) NOT VALID;
 8   ALTER TABLE ONLY public.orders DROP CONSTRAINT part_id;
       public          postgres    false    3185    212    212                  x?????? ? ?             x?????? ? ?            x?????? ? ?            x?????? ? ?     