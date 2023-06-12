use	Boost13Db;

go

-- delete from meyveler where id >16; id si 16 dan buyuk olanlari yapar

 -- truncate table meyveler;
select * from meyveler;


update meyveler set yer = N'isparta' where ad = N'elma';


-- icinde u harfi gecen meyveleri hataya bagla

update meyveler set yer = N'hatay' where ad like N'%u%';

select * from meyveler;


-- sonu k ile biten meyveleri coruma bagla
update meyveler set yer = N'Corum' where ad like N'%k';
select * from meyveler;


-- yer isimlerindeki a lari @ ile degistir

update meyveler set yer = replace(yer,N'a',N'@');

select * from meyveler;

update meyveler set ad = N'tea' where ad like (N'%cay%')
-- sonu rum ile biten yerleri buyuk harfe cevir ve sonuna eli ekle


update meyveler set yer = upper(concat(yer,N'eli')) where yer like N'%rum';


select * from meyveler;

-- k ile biten meyveleri sonundaki k yi q yap

update meyveler SET ad = concat(substring(ad, 1, len(ad) - 1), N'q') where ad like N'%k';
select * from meyveler;

-- 
update meyveler  set ad = upper(ad) where id % 2 = 0;
select * from meyveler;


update meyveler  set ad = Concat(N'<',lower(ad), N'>') where len(ad) = 3;
select * from meyveler;

update meyveler  set ad = Concat(ad,SUBSTRING(ad,1,1)) where len(ad) = 7; 


delete from meyveler where ad like N'%n%' or yer like N'%n%';


select * from meyveler;

--hepsini siler
delete from meyveler;
-- tabloyu sil

drop table meyveler;






