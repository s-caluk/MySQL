/*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur. 
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.
-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);
2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);
================================================================================================*/

create table students (
id int primary key,
student_name varchar(20) not null,
address varchar(50),
phone varchar(11) unique
);

/*---------------------------------------------------------------------
"sehirler" isimli bir Table olusturun. 
Tabloda "alan_kodu", "isim", "nufus" field'lari olsun. 
Isim field'i bos birakilamasin. 
1.Yontemi kullanarak "alan_kodu" field'ini "Primary Key" yapin
-----------------------------------------------------------------------*/
create table sehirler(
alan_kodu char(4) primary key,  -- 0212 gibi int de yapilabilir, char da.
isim varchar(20) not null,
nufus int
);
select * from sehirler;

/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin.(unique demek bu) 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/
create table ogretmenler(
id int unique,
isim varchar(25),
brans varchar(10),
cinsiyet varchar(5),
constraint id_isim_pk primary key (id, isim) -- id ve isimin birlesik halinden id_isim_pk isimli primary key yap
);

/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/
CREATE TABLE universite_ogrenci_bilgi_sistemi (
giris_yili DATE,
giris_siralamasi INT,
isim VARCHAR(15) NOT NULL,
bolum VARCHAR(5),
CONSTRAINT giris_yili_giris_siralamasi_pk PRIMARY KEY(giris_yili,giris_siralamasi)
);


/*====================================== FOREIGN KEY ==============================================
=> Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir. 
=> Foreign Key baska bir tablonun Primary Key'ine baglidir. 
=> Referenced table (baglanilan tablo, Primary Key'in oldugu Tablo) parent table olarak adlandirilir. 
   Foreign Key'in oldugu tablo ise child table olarak adlandirilir. 
=> Bir Tabloda birden fazla Foreign Key olabilir. 
=> Foreign Key NULL degeri alabilir. 
Note 1: "Parent Table" olmayan bir id'ye sahip datayi "Child Table"'a ekleyemezsiniz 
Note 2: Child Table'i silmeden Parent Table'i silemezsiniz. Once "Child Table" silinir, sonra "Parent Table" silinir.
        
-----Syntax-----
CONSTRAINT constraintName FOREIGN KEY(table_name_id) 
REFERENCES parent_table (parent_table_field_name) 

CREATE TABLE table_name
(
id char(10),
name char(10),
CONSTRAINT constraint_name 
FOREIGN KEY (table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
);
        
==================================================================================================*/

/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
create table tedarikci(
tedarikci_id int,
tedarikci_ismi varchar(15),
iletisim_isim varchar(20),
constraint tedarikci_pk primary key (tedarikci_id) 
);

create table urunler(
tedarikci_id int,
urun_id int,                                      -- constraint yaninda yazdigimiz urunler_fk gibi isimler biryerde gorunmuyor!
constraint urunler_fk foreign key (tedarikci_id)  -- ürünler tablosundaki tedarikci_id foreign key olsun diyor!
references tedarikci (tedarikci_id)     -- tedarikci tablosundaki tedarikci_id´sini referans alsin diyor!
);
select * from tedarikciler;
select * from urunler;

/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "puan"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
create table bebeler (
id int,
isim varchar(10),
iletisim varchar(10),
constraint bebeler_pk primary key (id)  -- sadece id nin yanina primary key yazsan da olurdu. 
);                                      -- ama constraint kullanmaya alismalisin, onunla foreign key yapabilirsin

create table notlar (
bebe_id int,
puan int,
constraint notlar_fk foreign key (bebe_id)
references bebeler (id)
);

select * from bebeler;
select * from notlar;

