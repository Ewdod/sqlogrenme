USE Boost13Db;
GO

-- ogrencileri listele

SELECT * FROM Ogrenciler;


 -- ogrencilerin adlarini ve soyadlarini listele

 SELECT Ad, Soyad FROM Ogrenciler;


 -- ogrencilerin adlarini firstname ve lastname olarak listele

 SELECT Ad AS FirstName, Soyad AS LastName FROM Ogrenciler;


 -- ogrencilerin adlarini first name ve last name olarak listele

 SELECT Ad AS 'First Name', Soyad AS 'Last Name' FROM Ogrenciler;
 SELECT Ad AS [First Name], Soyad AS [Last Name] FROM Ogrenciler;
 SELECT Ad  [First Name], Soyad  [Last Name] FROM Ogrenciler; -- as kelimesi opsiyoneldir


 -- ad soyad birlesik getir

 -- iyi olmayan yontem

 SELECT Ad + N' ' + Soyad AS [Tam ad] From Ogrenciler;

 SELECT CONCAT(Ad,N' ', Soyad,N' ', MezuniyetNotu) AS [Tam Ad] FROM Ogrenciler;


 Select 2 * 2;
 Print 2 * 2;

 -- adlar ve dogum yillari

 select Ad, Year(DogumTarihi) from Ogrenciler;

 -- saat kac
 print getdate();

 -- icinde bulundugumuz yil

 print year(getdate());

 -- ogrencilerin adlari ve yaslari


 select ad, year(getdate())-year(dogumtarihi) as Yas from Ogrenciler;

 select * from ogrenciler order by MezuniyetNotu asc;

 select * from ogrenciler order by EvliMi desc;

 -- ASC ascendin artan demek  DESC descending azalan demek

 -- siniftaki kadin ogrenciler

select * from ogrenciler where Cinsiyet = N'k';


-- evli ve kadin olan ogrencileri getir

select * from ogrenciler where cinsiyet = N'k' and EvliMi = 1;

-- dogdugu yil 1996 dan buyuk olanlar

select * from ogrenciler where Year(DogumTarihi) > 1996;


-- ID si cift sayi olanlar

select * from ogrenciler where Id % 2 = 0;

-- kan grubu pozitif olanlar

select * from ogrenciler where right(kangrubu,1) = N'+';
select * from Ogrenciler where KanGrubu like N'%+';

-- soyismi g ile baslayanlar

select * from Ogrenciler where left(Soyad,1) = N'g';

-- bunun yerine substring olarak da kullanabiliriz

select * from Ogrenciler where substring(Soyad,1,1) = N'g';

-- burada indeksler 1 den baslar 0 dan degil


-- soyadi baslangici g olsun sonrasi ne olursa olsun
select * from Ogrenciler where Soyad like N'g%';

select * from Ogrenciler where Soyad like N'%a%a%';

-- covid gecirmis erkekler

select * from ogrenciler where cinsiyet = N'e' and CovidGecirdiMi = 1;


-- kac ogrenci vardir
-- bu soruda aggreate function dedigimiz bir fonksiyon kullanacagiz

-- burada yildiz yerine null alabilen bir alani koyarsak burada sayi dogru cikmaz
-- null alabilen bir yeri koydugumuzda o bolgeyi saymaz ve bir tane varsa 11 yazar bizim sinifta
select count(*) from Ogrenciler;
select count(DogumTarihi) from Ogrenciler;



-- sinifin mezuniyet ortalamasi
select AVG(mezuniyetNotu) from ogrenciler;


-- aggregate  function yanina bir sutun yazamayiz
--select ad, AVG(mezuniyetNotu) from ogrenciler;

-- id so 3 5 8  ve 12 olan ogrenciler

select * from ogrenciler where id = 3 or id = 5 or id = 8 or id = 12;
select * from ogrenciler where id in (3,5,7,12);

-- id si 4 ile 9 araliginda olanlar


SELECT * FROM Ogrenciler WHERE ID>=4 AND ID<=9;
select * from ogrenciler where id between 4 and 9;


-- print rand(); 0 dahil ile 1 haric arasinda bir sayi dondurmeye yariyor baska bir sayi yapmak istersen bunu carpmamiz lazim

-- 0 ile 1 arasinda rastgele bir sayi 

print rand();

 print floor(rand() * 8 + 4)-- 4 11 araliginda sayi uretir
 

 -- ogrenci adlarini ve cinsiyetlerini getir ancak e yerine erkek k yerine kadin yazsin

 select ad, iif(cinsiyet = N'e', N'erkek', iif(cinsiyet = N'k', N'kadin', N'belirtilmedi')) from ogrenciler;


 -- yazi tura


 print iif(rand() *2 < 1, N'yazi',N'tura');


 -- wschools.com dan baktigimiz yerlere goz atmamiz lazim



