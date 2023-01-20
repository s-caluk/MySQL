/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/

-- SORU
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

use sys;

create table fen_lisesi(
okul_no int unique,
isim varchar(25) not null,
derece double,
adres varchar(50),
son_degisiklik_tarihi date
);

select * from fen_lisesi;

insert into fen_lisesi value(101,'mehmet dag', 4.5 , 'ankara', '2023-01-20');
insert into fen_lisesi value(106,'berrin hanim', 4.6 , 'istanbul', '2023-01-18');
insert into fen_lisesi value(103,'mehmet erden', 2.6 , 'izmir', '2023-01-16');
insert into fen_lisesi value(104,'sinan bey', 4.7 , 'istanbul', '2023-01-14');
insert into fen_lisesi value(105,'esra türker', 4.9 , 'ankara', '2023-01-12');
insert into fen_lisesi value(107, 'berivan gencdal' , 4.9 , 'ankara', '2023-01-12');
insert into fen_lisesi value(108, 'berivan gencdal' , null , null, null);
insert into fen_lisesi value(null, 'berivan gencdal' , null , null, null);
insert into fen_lisesi value(null, 'berivan gencdal' , null , null, null);
insert into fen_lisesi (isim, adres) value('abdullah ak', 'istanbul' );
insert into fen_lisesi (okul_no, isim, adres) value(109, 'yucel bey', 'istanbul' );
insert into fen_lisesi (isim, adres, okul_no) value('yucel bey', 'istanbul', 110 );


-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder,
-- diger kayitlarda duplicate hatasi verir.

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

create table anadolu_lisesi(
okul_no varchar(4) unique,
isim varchar(25) not null,
adres varchar(10),
derece double
);

select * from anadolu_lisesi;
drop table anadolu_lisei;

insert into anadolu_lisesi values ('1001', 'ayse nuriye', 'istanbul', 4.7);
insert into anadolu_lisesi values ('1002', 'zafer bey', 'ankara', 4.6);
insert into anadolu_lisesi values ('1003', 'furkan veli inal', 'istanbul', 4.9);
insert into anadolu_lisesi values ('1004', 'humeyra uysal', 'izmir', 4.7);
insert into anadolu_lisesi values ('1005', 'mehmet harun', 'istanbul', 3.8);
insert into anadolu_lisesi values ('', 'mehmet harun', 'istanbul', 3.8);
insert into anadolu_lisesi values (1006, 'berivan gencdal', 'istanbul', 3.8);
insert into anadolu_lisesi (isim, adres) values ('berrin hanim', 'ankara');
insert into anadolu_lisesi (okul_no, isim, derece) values ('1007', 'yeter hanim', 3.6);
