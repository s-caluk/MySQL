-- yorum satiri
-- bu da 2. yorum satiri
/*
burasi yorum 
pragrafi örnegi
*/

use sys;

/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

CREATE TABLE ogrenciler1( 
id CHAR(4),
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adress VARCHAR(100),
son_degistirme_tarihi DATE 
);

DROP TABLE ogrenciler2;

SELECT * FROM ogrenciler1;


/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/

CREATE TABLE tedarikciler(
tedarikci_id CHAR(4),
tedarikci_ismi VARCHAR(25),
tedarikci_adres VARCHAR(100),
ulasim_tarihi DATE
);

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

CREATE TABLE ogrenci_derece
AS
SELECT isim, not_ortalamasi
FROM ogrenciler1;

SELECT * FROM ogrenci_derece;

/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

create table tedarikciler_son
as
select tedarikci_ismi, ulasim_tarihi
from tedarikciler;

select * from tedarikciler_son;




 