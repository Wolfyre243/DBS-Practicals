PGDMP  8                    |            highgarden_polytechnic    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16425    highgarden_polytechnic    DATABASE     �   CREATE DATABASE highgarden_polytechnic WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Singapore.1252';
 &   DROP DATABASE highgarden_polytechnic;
                postgres    false            �            1259    16431    course    TABLE     �   CREATE TABLE public.course (
    crse_code character varying(5) NOT NULL,
    crse_name character varying(100) NOT NULL,
    offered_by character varying(5) NOT NULL,
    crse_fee numeric(7,2) NOT NULL,
    lab_fee numeric(7,2)
);
    DROP TABLE public.course;
       public         heap    postgres    false            �            1259    16436 
   department    TABLE     &  CREATE TABLE public.department (
    dept_code character varying(5) NOT NULL,
    dept_name character varying(100) NOT NULL,
    hod character(4) NOT NULL,
    no_of_staff integer,
    max_staff_strength integer,
    budget numeric(9,2),
    expenditure numeric(9,2),
    hod_appt_date date
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    16426    staff    TABLE     �  CREATE TABLE public.staff (
    staff_no character(4) NOT NULL,
    staff_name character varying(100) NOT NULL,
    supervisor_staff_no character(4),
    dob date NOT NULL,
    grade character varying(5) NOT NULL,
    marital_status character varying(1) NOT NULL,
    pay numeric(7,2),
    allowance numeric(7,2),
    hourly_rate numeric(7,2),
    gender character(1) NOT NULL,
    citizenship character varying(10) NOT NULL,
    join_yr integer NOT NULL,
    dept_code character varying(5) NOT NULL,
    type_of_employment character varying(2) NOT NULL,
    highest_qln character varying(10) NOT NULL,
    designation character varying(20) NOT NULL
);
    DROP TABLE public.staff;
       public         heap    postgres    false            �          0    16431    course 
   TABLE DATA           U   COPY public.course (crse_code, crse_name, offered_by, crse_fee, lab_fee) FROM stdin;
    public          postgres    false    216   �       �          0    16436 
   department 
   TABLE DATA           �   COPY public.department (dept_code, dept_name, hod, no_of_staff, max_staff_strength, budget, expenditure, hod_appt_date) FROM stdin;
    public          postgres    false    217   �       �          0    16426    staff 
   TABLE DATA           �   COPY public.staff (staff_no, staff_name, supervisor_staff_no, dob, grade, marital_status, pay, allowance, hourly_rate, gender, citizenship, join_yr, dept_code, type_of_employment, highest_qln, designation) FROM stdin;
    public          postgres    false    215          $           2606    16435    course course_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (crse_code);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public            postgres    false    216            &           2606    16440    department department_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_code);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    217            "           2606    16430    staff staff_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_no);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    215            �      x������ � �      �      x������ � �      �      x������ � �     