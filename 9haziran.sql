use Boost13Db;

-- group by grup uzerinde toplu islemler yapmak icin kullanilir


select cinsiyet,
	avg(MezuniyetNotu) [not ortalamasi],
	max(ad),
	string_agg(ad,'-'),
	sum(cast(evlimi as int)),
	count(*)

from Ogrenciler GROUP BY cinsiyet;

-- onemli not select cumleciginde yalin halde sadece ve  sadece group by cumleciginde belirtilen sutunlar kullanilabilir


-- birden cok sutuna gore gruplama yapilabilirmi?

select 
evlimi,
cinsiyet,
count(*)
from ogrenciler
group by evlimi, cinsiyet


select 
	left(sehirad,1),
	count(*),
	string_agg(sehirad,'-')
	from Sehirler
	group by left(sehirad, 1);



-- not: having gruplara groe islem yapilip sonuclar kesinlestikten sonra kosullu filtreleme yaparken where ise gruplama oncesinde calisir

select 
	left(sehirad,1),
	count(*),
	string_agg(sehirad,'-')
	from Sehirler
	group by left(sehirad, 1)
	having count(*) = 1;


-- peki hem havinge hemde where ihtiyac duyan soru yazabilirmisiniz

-- bas harflerine gore nufusu 1 milyon dan kucuk sehir sayilari ve adlari adetleri ucun altinda kalanlari goster


select 
	left(sehirad,1),
	count(*) as adedi,
	string_agg(sehirad,'-')
from Sehirler
where nufus < 1000000
group by left(sehirad, 1)
having count(*) < 3
order by adedi;


-- select from where group by having order by asc/desc




-- medeni duruma gore ogrenci sayilari

-- dogdugu ayin turkce adina gore ogrenci sayilari ve adlari virgulle ayrilmis


select 
iif(evlimi = 1, N'Evli',iif(evlimi = 0,'evsiz',N'Null')),
count(*),
string_agg(ad,'-')

from ogrenciler
group by EvliMi;


select 
format(dogumtarihi,'MMMM',N'tr') as dogum,
count(*),
string_agg(ad,',')
from ogrenciler o1
group by  format(dogumtarihi,'MMMM',N'tr');



-- 1
select 
BolgeAd,
count(*)
from sehirler s
join bolgeler b on s.BolgeId = b.id
group by BolgeAd


-- 2
select
SehirAd,
string_agg(ad,'-')
from Sehirler  join ogrenciler on sehirler.Id = ogrenciler.DogumYeriId
group by SehirAd


-- 3
select
bolgead,
format(sum(sehirler.Nufus),'N0') as [toplam nufus]
from Bolgeler  join sehirler  on bolgeler.Id = sehirler.BolgeId
group by BolgeAd


-- 4

select
bolgead,
count(sehirler.SehirAd)
from bolgeler  join sehirler  on bolgeler.id = sehirler.BolgeId where SehirAd  like N'%a%'
group by BolgeAd



