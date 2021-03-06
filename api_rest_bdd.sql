PGDMP     !                    x           api_rest    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    44003    api_rest    DATABASE     �   CREATE DATABASE api_rest WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE api_rest;
                postgres    false            �            1259    44006 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    nom character varying(256),
    description text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    44004    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    203                       0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    202            �            1259    44019    produits    TABLE       CREATE TABLE public.produits (
    id integer NOT NULL,
    nom character varying(256),
    description text,
    prix numeric(5,2),
    categories_id integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.produits;
       public         heap    postgres    false            �            1259    44017    produits_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produits_id_seq;
       public          postgres    false    205                       0    0    produits_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produits_id_seq OWNED BY public.produits.id;
          public          postgres    false    204            �
           2604    44009    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    44022    produits id    DEFAULT     j   ALTER TABLE ONLY public.produits ALTER COLUMN id SET DEFAULT nextval('public.produits_id_seq'::regclass);
 :   ALTER TABLE public.produits ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205                      0    44006 
   categories 
   TABLE DATA           R   COPY public.categories (id, nom, description, created_at, updated_at) FROM stdin;
    public          postgres    false    203   �                 0    44019    produits 
   TABLE DATA           e   COPY public.produits (id, nom, description, prix, categories_id, created_at, updated_at) FROM stdin;
    public          postgres    false    205   �                  0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    202                       0    0    produits_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.produits_id_seq', 1, false);
          public          postgres    false    204            �
           2606    44016    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    203            �
           2606    44029    produits produits_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.produits
    ADD CONSTRAINT produits_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.produits DROP CONSTRAINT produits_pkey;
       public            postgres    false    205            �
           2606    44030 $   produits produits_categories_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produits
    ADD CONSTRAINT produits_categories_id_fkey FOREIGN KEY (categories_id) REFERENCES public.categories(id);
 N   ALTER TABLE ONLY public.produits DROP CONSTRAINT produits_categories_id_fkey;
       public          postgres    false    205    203    2702                  x������ � �            x������ � �     