/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
========================================================================================*/
use sys;
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/
create table firmalar(
id int,
isim varchar (20),
iletisim_isim varchar (20),
constraint firmalar_pk primary key (id, isim)
);

/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
insert into firmalar values
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');

select * from firmalar;

-- id´si 3 olan firmanin ismini 'KRM' olarak güncelleyiniz.
-- update icin sorun oluyorsa > einstellung > SQL editor> safe update´deki tik i kaldir!

update firmalar
set isim = 'KRM'
where id = 3;

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
update firmalar 
set id = 4, isim = 'FSD'
where iletisim_isim = 'Veli Gul';

-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.
update firmalar
set iletisim_isim = 'Osman Can'
where id = 1;  -- where isim='ACB' de olur

-- iletisim ismi 'Osman Can' olan firmanin iletisim ismini 'Ayse Can' olarak degistir.
update firmalar
Set iletisim_isim= 'Ayse Can'
where iletisim_isim='Osman Can' ;





