PGDMP      -                |            highgarden_university    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16556    highgarden_university    DATABASE     �   CREATE DATABASE highgarden_university WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Singapore.1252';
 %   DROP DATABASE highgarden_university;
                postgres    false            �            1259    16562    course    TABLE     �   CREATE TABLE public.course (
    crse_code character varying(5) NOT NULL,
    crse_name character varying(100) NOT NULL,
    offered_by character varying(5) NOT NULL,
    crse_fee numeric(7,2) NOT NULL,
    lab_fee numeric(7,2)
);
    DROP TABLE public.course;
       public         heap    postgres    false            �            1259    16567 
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
       public         heap    postgres    false            �            1259    16557    staff    TABLE     �  CREATE TABLE public.staff (
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
       public         heap    postgres    false            �            1259    16577    staff_backup    TABLE     �  CREATE TABLE public.staff_backup (
    staff_no character(4) NOT NULL,
    staff_name character varying(100) NOT NULL,
    supervisor character(4),
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
     DROP TABLE public.staff_backup;
       public         heap    postgres    false            �          0    16562    course 
   TABLE DATA           U   COPY public.course (crse_code, crse_name, offered_by, crse_fee, lab_fee) FROM stdin;
    public          postgres    false    216   �       �          0    16567 
   department 
   TABLE DATA           �   COPY public.department (dept_code, dept_name, hod, no_of_staff, max_staff_strength, budget, expenditure, hod_appt_date) FROM stdin;
    public          postgres    false    217   �       �          0    16557    staff 
   TABLE DATA           �   COPY public.staff (staff_no, staff_name, supervisor_staff_no, dob, grade, marital_status, pay, allowance, hourly_rate, gender, citizenship, join_yr, dept_code, type_of_employment, highest_qln, designation) FROM stdin;
    public          postgres    false    215   <       �          0    16577    staff_backup 
   TABLE DATA           �   COPY public.staff_backup (staff_no, staff_name, supervisor, dob, grade, marital_status, pay, allowance, hourly_rate, gender, citizenship, join_yr, dept_code, type_of_employment, highest_qln, designation) FROM stdin;
    public          postgres    false    218   �       (           2606    16566    course course_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (crse_code);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public            postgres    false    216            *           2606    16571    department department_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_code);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    217            ,           2606    16581    staff_backup staff_backup_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.staff_backup
    ADD CONSTRAINT staff_backup_pkey PRIMARY KEY (staff_no);
 H   ALTER TABLE ONLY public.staff_backup DROP CONSTRAINT staff_backup_pkey;
       public            postgres    false    218            &           2606    16561    staff staff_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_no);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    215            �   �   x�}ν�0�}�>�Q�	�0�T�z�rK(��ؒ��q����92DBgl� KF��c�i���")sqN�+�Y�5���a9>l�΢vq^E��?k6���J]����HqK�)$���R�����膉��Tf
�3����ŦŖ��]�N�cC�
d����3�{w��V��OLe�      �   �   x�Mα�0���lN%W,�]�H��bh�����{�H���[���M	�x?%~LJ�\ַ��`�5R�� �m�G�Q0[x�7!D�@+���Z�m�(.0궁����-��h�����\���xR���"U��'9�f��)
w�լKc_?�9u      �   �  x�u�Ko�0�ח_�He�8�%�i�d��H���"V�&� ����^�y0�����s�o���5gcx*Y�x 8l9d��=1�1���ȍ�TǺѸ<� [¦�ݡ��i��\7��`��Ґ��K�#nQ9^<¾"Q�ʄu�E���>^���1y˃j*}��a�y�$lj�I�Q�� S��>§~Y�=�� �����{G��	�@�R�X���Dt�����H5��>kU[º4�z�'��`;����߽�B�/e	������FY��a�i���"�Y#xA��r~�a?L�[�QE�>�ё/�#���f��=�Q�����P�xJN`�ނ�W>�����z�횗W�F��W	.v/�l����!�n�wi4����T>��U�]�KT�a��{i����X\�貕�݉c�z������r��A�Jْ����o��K�eH#��K
�\��=�1�k�9}���.�k�1�|q,�m��hB�P��69�����&؂�1�?����N����b��a�����n�cx
�J+[7�f;M�I�JP������X��Unm��S���? {\e� ��i��3T��WKY?T��awo���5���QUw��/��,��8D^#$��+��y���a�����d�k9z�      �   �  x�u�Ko�0�ח_�He�8�%�i�d��H���"V�&� ����^�y0�����s�o���5gcx*Y�x 8l9d��=1�1���ȍ�TǺѸ<� [¦�ݡ��i��\7��`��Ґ��K�#nQ9^<¾"Q�ʄu�E���>^���1y˃j*}��a�y�$lj�I�Q�� S��>§~Y�=�� �����{G��	�@�R�X���Dt�����H5��>kU[º4�z�'��`;����߽�B�/e	������FY��a�i���"�Y#xA��r~�a?L�[�QE�>�ё/�#���f��=�Q�����P�xJN`�ނ�W>�����z�횗W�F��W	.v/�l����!�n�wi4����T>��U�]�KT�a��{i����X\�貕�݉c�z������r��A�Jْ����o��K�eH#��K
�\��=�1�k�9}���.�k�1�|q,�m��hB�P��69�����&؂�1�?����N����b��a�����n�cx
�J+[7�f;M�I�JP������X��Unm��S���? {\e� ��i��3T��WKY?T��awo���5���QUw��/��,��8D^#$��+��y���a�����d�k9z�     