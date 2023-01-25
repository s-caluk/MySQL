
use sys;
-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.
CREATE TABLE tedarik
(
id INT PRIMARY KEY,
isim VARCHAR(10),
irtibat VARCHAR(15)
);
-- tedarikci_id , urun_id , urun_isim , musteri_isim  fieldlari olan urun 
-- tablosu olusturun. Bu tablodaki tedarikci_id fieldini tedarik tablosunun
-- PK 'si ile Foreign Key yapin.
CREATE TABLE urun
(
tedarikci_id INT,
urun_id INT,
urun_isim VARCHAR(10),
musteri_isim VARCHAR(15),
CONSTRAINT urun_fk FOREIGN KEY (tedarikci_id)
REFERENCES tedarik (id)
);
INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can'); 
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz'); 
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can'); 
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman'); 
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma'); 
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan'); 
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');
SELECT * FROM tedarik;
SELECT * FROM urun;
-- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can' olarak degistiriniz.
UPDATE tedarik
SET irtibat = 'Veli Can'
WHERE isim = 'LG';
-- Ali Can'in aldigi urunun ismini Apple olarak degistirin
UPDATE urun
SET urun_isim = 'apple'
WHERE musteri_isim = 'Ali Can';
-- Irtibat'i Merve Temiz olan kaydin sirket ismini getirin
SELECT isim
FROM tedarik
WHERE irtibat = 'Merve Temiz';
/*
a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */


