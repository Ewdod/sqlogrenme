use Boost13Db;
go

SELECT 
    CONCAT(
        DATEPART(WEEKDAY, DogumTarihi), 
        ' - ', 
        FORMAT(DogumTarihi, 'dddd', 'tr-TR')
    ) AS GunNumarasiVeAdi from ogrenciler;



select ROUND(MezuniyetNotu,1) from ogrenciler;

select format(avg(mezuniyetnotu),'#.####') from Ogrenciler;

SELECT ad,
       CASE
           WHEN cinsiyet = N'e' THEN CONCAT(ad, N' Bey')
           WHEN cinsiyet = N'k' THEN CONCAT(ad, N' Hanim')
           ELSE N''
       END AS tam_ad
FROM ogrenciler;




SELECT N'★★☆☆☆☆☆☆☆☆☆☆';

select
upper(ad) as [adlar], concat(replicate(N'★',MONTH(dogumtarihi)),REPLICATE(N'☆' , 12-MONTH(dogumtarihi))) as [dogum aylari]
from Ogrenciler;


-- bu sorguda her ogrenci icin belirli bir formatta kullanici adi ureteceksiniz
 -- kurallar bosluk ve turkce karakter olmayacak
select * from ogrenciler;


SELECT 
       CASE
           WHEN cinsiyet = N'e'  THEN CONCAT(N'Mr',ad,Soyad,RIGHT(2,year(dogumtarihi)))
           WHEN cinsiyet = N'k' and evlimi = 0 THEN CONCAT(N'Mrs',ad,Soyad,RIGHT(year(dogumtarihi),2))		   
           WHEN cinsiyet = N'k' and evlimi = 1 THEN CONCAT(N'Ms',ad,Soyad,RIGHT(year(dogumtarihi),2))
           ELSE N''
       END collate Latin1_General_CI_AI AS tam_ad
	   
FROM ogrenciler;


SELECT 
    CONCAT(
        IIF(Cinsiyet = N'e', N'Mr', IIF(Cinsiyet = N'k' AND EvliMi = 1, N'Mrs', IIF(Cinsiyet = N'k' AND EvliMi = 0, N'Ms', NULL))),
        TRANSLATE(REPLACE(Ad + Soyad, N' ', N'') COLLATE TURKISH_CS_AS, N'ıöçşğüİÖÇŞĞÜ', N'iocsguIOCSGU'),
        FORMAT(DogumTarihi, N'yy')
    ) AS [Takma Ad]
FROM Ogrenciler;

-- cursor


