use Boost13Db;
select * from Ogrenciler;


select ad, DATEDIFF(day,dogumtarihi,GETDATE()) from ogrenciler;


-- ogrenciler 10000 . gununu ne zaman yasadi ya da yasayacak


select ad, DATEADD(day,10000,dogumtarihi) from ogrenciler;



select ad, format(DogumTarihi,'D','tr-TR') from ogrenciler;
select ad, format(DogumTarihi,'d','tr-TR') from ogrenciler;


--string fonksiyonlari

 -- math fonk
 -- format fonk
 -- convert fonk
 --aggreegate fonk

