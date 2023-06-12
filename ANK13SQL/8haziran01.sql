use Boost13Db;
go

select * from ogrenciler where mezuniyetnotu > 3;

-- soru degisken tanimlamadandegeri manuel girmeden notu sinif ortalamasinin uzerinde olanlari getir


select * from ogrenciler where mezuniyetnotu > (select AVG(MezuniyetNotu) from ogrenciler);

select concat(ad,N' ',ad) from ogrenciler as [o1] where id=o1.id+1;


select ad, (select ad from ogrenciler where id = o1.id + 1) from ogrenciler as o1;


select * from (select top 3 * from ogrenciler order by ad) t order by mezuniyetnotu;

select
	ad, 
	format(dogumtarihi, N'MMMM',N'tr') ay,
	(select string_agg(ad,N',') from ogrenciler where month(dogumtarihi)  = month(o1.dogumtarihi) and id != o1.Id) [ayni ayda doganlar]
from ogrenciler as o1;

select STRING_AGG(ad,N'-') from Ogrenciler;

select o2.id, o1.ad, o2.* from ogrenciler o1, ogrenciler o2 where left(o2.ad,1) = SUBSTRING(o1.ad,3,1);

-- herkesin idsinin yanina bir fazlasina sahip olan kisinin bilgileri gelsin


-- eslesenleri getirir
select o1.id ,o1.ad, o2.id,o2.ad from Ogrenciler o1 inner join ogrenciler o2 on o1.id +1 = o2.id;

-- eslesmeyenleri de getirir
select o1.id ,o1.ad, o2.id,o2.ad from Ogrenciler o1 left outer join ogrenciler o2 on o1.id +1 = o2.id;





