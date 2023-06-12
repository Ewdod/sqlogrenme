use Boost13Db;
go

select * from Ogrenciler;


select ad,cinsiyet from ogrenciler;

select ad, iif(covidgecirdimi = 1 ,N'gecirdi', iif(covidgecirdimi = 0 , N'gecirmedi',N''))  [covid gecirdi mi] from ogrenciler;

select 
	ad,
	case covidgecirdimi
		when 0 then N'gecirmedi'

		when 1 then N'gecirdi'
		else N''

		end as [covid gecirme durumu] -- buradaki as opsiyonel
from Ogrenciler
