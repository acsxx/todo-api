PGDMP                           z            ToDo    14.3    14.3 %               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    16394    ToDo    DATABASE     c   CREATE DATABASE "ToDo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1252';
    DROP DATABASE "ToDo";
                postgres    false            ?            1259    16432    Roles    TABLE     Y   CREATE TABLE "public"."Roles" (
    "id" integer NOT NULL,
    "role" "text" NOT NULL
);
    DROP TABLE "public"."Roles";
       public         heap    postgres    false            ?            1259    16454    TeamMembers    TABLE     ?   CREATE TABLE "public"."TeamMembers" (
    "id" integer NOT NULL,
    "team_name" "text" NOT NULL,
    "user_name" "text" NOT NULL,
    "createdAt" "date" DEFAULT "now"(),
    "updatedAt" "date" DEFAULT "now"()
);
 #   DROP TABLE "public"."TeamMembers";
       public         heap    postgres    false            ?            1259    16453    TeamMembers_row_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."TeamMembers_row_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "public"."TeamMembers_row_id_seq";
       public          postgres    false    218            "           0    0    TeamMembers_row_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "public"."TeamMembers_row_id_seq" OWNED BY "public"."TeamMembers"."id";
          public          postgres    false    217            ?            1259    16441    Teams    TABLE     ?   CREATE TABLE "public"."Teams" (
    "id" integer NOT NULL,
    "title" "text" NOT NULL,
    "owner_id" integer NOT NULL,
    "createdAt" "date" DEFAULT "now"(),
    "updatedAt" "date" DEFAULT "now"()
);
    DROP TABLE "public"."Teams";
       public         heap    postgres    false            ?            1259    16440    Team_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."Team_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE "public"."Team_id_seq";
       public          postgres    false    216            #           0    0    Team_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE "public"."Team_id_seq" OWNED BY "public"."Teams"."id";
          public          postgres    false    215            ?            1259    16402    Todos    TABLE     )  CREATE TABLE "public"."Todos" (
    "todo" "text" NOT NULL,
    "owner_id" integer NOT NULL,
    "id" integer NOT NULL,
    "createdAt" "date" DEFAULT "now"(),
    "updatedAt" "date" DEFAULT "now"(),
    "updated_userid" integer,
    "isDone" boolean NOT NULL,
    "isPrivate" boolean NOT NULL
);
    DROP TABLE "public"."Todos";
       public         heap    postgres    false            ?            1259    16417    Users    TABLE       CREATE TABLE "public"."Users" (
    "id" integer NOT NULL,
    "username" "text" NOT NULL,
    "email" "text" NOT NULL,
    "createdAt" "date" DEFAULT "now"(),
    "updatedAt" "date" DEFAULT "now"(),
    "role" "text" DEFAULT 'user'::"text",
    "password" "text" NOT NULL
);
    DROP TABLE "public"."Users";
       public         heap    postgres    false            ?            1259    16416    Users_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."Users_id_seq";
       public          postgres    false    212            $           0    0    Users_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "public"."Users_id_seq" OWNED BY "public"."Users"."id";
          public          postgres    false    211            ?            1259    16431    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE "public"."roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."roles_id_seq";
       public          postgres    false    214            %           0    0    roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "public"."roles_id_seq" OWNED BY "public"."Roles"."id";
          public          postgres    false    213            ?            1259    16408    todoList_id_seq    SEQUENCE     ?   ALTER TABLE "public"."Todos" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."todoList_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            v           2604    16435    Roles id    DEFAULT     r   ALTER TABLE ONLY "public"."Roles" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."roles_id_seq"'::"regclass");
 =   ALTER TABLE "public"."Roles" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    213    214    214            z           2604    16457    TeamMembers id    DEFAULT     ?   ALTER TABLE ONLY "public"."TeamMembers" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."TeamMembers_row_id_seq"'::"regclass");
 C   ALTER TABLE "public"."TeamMembers" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    217    218    218            w           2604    16444    Teams id    DEFAULT     q   ALTER TABLE ONLY "public"."Teams" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Team_id_seq"'::"regclass");
 =   ALTER TABLE "public"."Teams" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    215    216    216            r           2604    16420    Users id    DEFAULT     r   ALTER TABLE ONLY "public"."Users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Users_id_seq"'::"regclass");
 =   ALTER TABLE "public"."Users" ALTER COLUMN "id" DROP DEFAULT;
       public          postgres    false    211    212    212                      0    16432    Roles 
   TABLE DATA                 public          postgres    false    214   ?&                 0    16454    TeamMembers 
   TABLE DATA                 public          postgres    false    218   ?&                 0    16441    Teams 
   TABLE DATA                 public          postgres    false    216   N'                 0    16402    Todos 
   TABLE DATA                 public          postgres    false    209   ?'                 0    16417    Users 
   TABLE DATA                 public          postgres    false    212   ?(       &           0    0    TeamMembers_row_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"public"."TeamMembers_row_id_seq"', 17, true);
          public          postgres    false    217            '           0    0    Team_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."Team_id_seq"', 18, true);
          public          postgres    false    215            (           0    0    Users_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"public"."Users_id_seq"', 50, true);
          public          postgres    false    211            )           0    0    roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"public"."roles_id_seq"', 1, false);
          public          postgres    false    213            *           0    0    todoList_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"public"."todoList_id_seq"', 10, true);
          public          postgres    false    210            ?           2606    16461    TeamMembers TeamMembers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "public"."TeamMembers"
    ADD CONSTRAINT "TeamMembers_pkey" PRIMARY KEY ("id");
 L   ALTER TABLE ONLY "public"."TeamMembers" DROP CONSTRAINT "TeamMembers_pkey";
       public            postgres    false    218            ?           2606    16448    Teams Team_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "public"."Teams"
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY ("id");
 ?   ALTER TABLE ONLY "public"."Teams" DROP CONSTRAINT "Team_pkey";
       public            postgres    false    216            ?           2606    16426    Users Users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    212            ?           2606    16439    Roles roles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."Roles"
    ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."Roles" DROP CONSTRAINT "roles_pkey";
       public            postgres    false    214            ~           2606    16415    Todos todoList_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "public"."Todos"
    ADD CONSTRAINT "todoList_pkey" PRIMARY KEY ("id");
 C   ALTER TABLE ONLY "public"."Todos" DROP CONSTRAINT "todoList_pkey";
       public            postgres    false    209               
   x???             ?   x???v
Q???WP*(M??LV?S
IM??M?MJ-*VR?P?LQ?QP*
??%概8?ũEpNrQjbIj?c	X? ??Ts?	uV?04?QP/I-.?e?h###]S]#K4??5?'}?f??i????? ??WM         y   x???v
Q???WP*(M??LV?S
IM?-VR?P?LQ?QP*?,?I1???R??!??E??%?)?% NiA
????????ah???^?Z\2M]G???7202?50?5?TG?iZsqq ~=%?         ?   x?ՒO?@??~?a/?aR?t?X0?A'1?@0Wֵ?~?v??P??<?c?a~???aď@m??MQ?J?!А???KCyV???Zp?Z?b}[?B?w??6:?5T??η1?@??aH?o ?G?????Wj?Z?S[???K0??b?[?T?0M?X覥?&??<??T?d???@???L??????ݯ?慨????	????@?ݝ_?>ګ(W?L?         
  x???OO?0??|??Y$@چ	?'??7@?֭?[???^K0?x?????'o?_?~? A????Y!r؃K͕??? ??QҒ[?K*
krũ?ld΋?}U?iM?>V??6X??K????Mõi^?fk?????A?t??%??d????`?$?fce?$??!????^1?T??cyKgO?~&O?G=???F???.???/d?wf?J!@???~???I?:;Mw?w}?K???%?"/??l??V2?7f????B7?o??     