use Boost13Db;

select ad from ogrenciler where id = floor(rand()*12 +1);

select 
case 
 when cinsiyet = N'e' then concat(ad,N' Bey')
 when cinsiyet = N'k' then concat(ad,N' Hanim')
 else N''
end
from ogrenciler;


SELECT *
FROM ogrenciler
WHERE MezuniyetNotu > (SELECT AVG(MezuniyetNotu) FROM ogrenciler);

select 
ad,
(select ad  from ogrenciler o2 where o1.id + 1 = o2.id )
from ogrenciler o1;

select
ad ,
(select datename(month,o1.dogumtarihi) from ogrenciler where id = o1.id),
(select string_agg(ad,'-') from ogrenciler where Month(o1.dogumtarihi) = month(DogumTarihi))
from Ogrenciler o1;


select 
ad,
id,
outer join (select * from ogrenciler o2)
from Ogrenciler o1 where left(ad,1) = SUBSTRING(o1.ad,3,1);

SELECT
  o1.ad,
  o1.id
FROM Ogrenciler o1
WHERE EXISTS (
  SELECT 1 FROM ogrenciler o2 WHERE LEFT(o1.ad, 1) = SUBSTRING(o2.ad, 3, 1)
);



SELECT
  o1.ad,
  o1.id
FROM Ogrenciler o1
LEFT JOIN (
  SELECT * FROM ogrenciler
) o2 ON LEFT(o1.ad, 1) = SUBSTRING(o2.ad, 3, 1);

--SELECT
--  ad,
--  (SELECT DATENAME(MONTH, o2.dogumtarihi) FROM ogrenciler o2 WHERE o2.id = o1.id) AS ay_adı
--FROM Ogrenciler o1;


select 
ad,
left(ad,1),
(select count(*) from ogrenciler where left(o1.ad,1) = left(ad,1)),
(select string_agg(ad,'-') from ogrenciler where LEFT(o1.ad,1) = left(ad,1))
from ogrenciler o1;


select * from ogrenciler o1 join sehirler s1  on o1.dogumyeriid = s1.id;

select * from sehirler s1 join bolgeler b1 on s1.BolgeId = b1.Id order by BolgeAd;


select * from ogrenciler o1 join sehirler s1 on o1.DogumYeriId = s1.Id join bolgeler b1 on s1.BolgeId = b1.id;

select * from ogrenciler o1 join sehirler s1 on o1.DogumYeriId = s1.id and s1.id != 6;

select BolgeAd,

(select count(*) from sehirler where b1.id = bolgeid)

from bolgeler b1;