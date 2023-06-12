use Boost13Db;
go

select * from sehirler;

select * from bolgeler;

select* from ogrenciler;


-- her ogrencinin yaninda dogdugu yerin adi ve diger bilgileri gozuksun


SELECT o.*, s.* FROM ogrenciler o INNER JOIN sehirler s ON o.DogumYeriId = s.id;

-- eger dogum yeri idsi bulunmayan yasin de olsun istiyorsaniz inner join yerine left outer join yapmaliyiz yani soldaki tablonun butun bilgileri her halukarda gelsin

/*

es anlamlilar 
join = inner join
left join = left outer join
right join = right outer join




*/

select s.*, b.* from sehirler s inner join Bolgeler b on s.BolgeId = b.id;



SELECT o.*
FROM ogrenciler o
INNER JOIN sehirler s ON o.dogumyeriid = s.id
WHERE o.dogumyeriid != '0006';



select o.ad, s.sehirad, b.bolgead from ogrenciler o
inner join sehirler s on o.dogumyeriid = s.id
inner join bolgeler b on s.bolgeid=b.id;


select ad, sehirler.sehirad from ogrenciler
inner join sehirler on ogrenciler.dogumyeriid = sehirler.id
where dogumyeriid !=6;


select bolgead, (select count(*) from sehirler s where s.bolgeid = b.Id) from bolgeler b;



select bolgead, (select format(sum(nufus),'N0') from sehirler where bolgeler.id = sehirler.bolgeid) from bolgeler;



