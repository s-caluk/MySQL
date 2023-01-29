

use sys; 

CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


select * from isciler;

-- 1) Isme gore toplam maaslari bulun

select isim, sum(maas) as toplam_maas
from isciler
group by isim;

-- 2) Sehre gore toplam isci sayisini bulun
select sehir,count(isim) as isci_sayisi
from isciler
group by sehir;

-- 3) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun

select sirket,count(isim) as isci_sayisi
from isciler
where maas>5000
group by sirket;

-- 4) Her sirket icin Min ve Max maasi bulun

select sirket, min(maas) as min_maas, max(maas) as max_maas
from isciler
group by sirket
order by max_maas desc;