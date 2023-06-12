use Boost13Db;
select * from ogrenciler;


-- kullanici tanimli fonksiyonlara Used defined Function UDF denir
--fonksiyonlar iki go arasina yazilir

-- e y i erkege k yi kadina donusturen fonksiyon
--s1l de fonksiyonlar mutlaka bir deger dondurur

--bu degerler int nvarchar gibi skalar turler olabilecegi gibi bir tabloda olabilir
-- fonksiyonlar select sorgularinda kullanilabilir

go

-- SCALAR VALUED FUNCTION

--create function FormatCinsiyet(@cinsiyetKodu nvarchar(1)) returns nvarchar(5)
--as
--begin

--return case @cinsiyetKodu 
--when N'e' then N'Erkek'
--when N'k' then N'Kadin'
--else @cinsiyetkodu
--end;

--end

--go


select ad, dbo.FormatCinsiyet(cinsiyet) from Ogrenciler;


--table valued function tanimlayalim
-- fibonacci sayi dizisini tablo halinde donduren fonksiyonu yaziniz

GO

--create function Fibonacci() returns @sonuc table(sayi int)
--as
--begin 
--insert into @sonuc values(0),(1);

--while (select count(*) from @sonuc) < 32
--begin


--insert into @sonuc select sum(sayi) from (select top 2 sayi from @sonuc order by sayi desc) t;

--end

--return;

--end

GO

select * from dbo.fibonacci();


go

--ALTER FUNCTION Fibonacci2()
--RETURNS @fibonacci TABLE (sayi bigint)
--AS
--BEGIN 
--    DECLARE @a bigint = 0;
--    DECLARE @b bigint = 1;
--    DECLARE @toplam bigint;
--	insert into @fibonacci values (@a),(@b)
--    WHILE (SELECT COUNT(*) FROM @fibonacci) < 50
--    BEGIN
--         SET @toplam = @a + @b;
--        SET @a = @b;
--        SET @b = @toplam;

--        INSERT INTO @fibonacci VALUES (@toplam);
--    END

--    RETURN;
--END
--GO

SELECT * FROM dbo.Fibonacci2();

-- ogrencilerin tam adlarini yaslariyla donduren fonksiyonu yaz

--go
--create function ogrencilerYaslar() Returns table
--as 
-- return select 
--	concat(ad,N' ' ,soyad) as tamad,
--	datediff(year,DogumTarihi,GETDATE()) [yas]
-- from Ogrenciler

-- go

 select * from Ogrencileryaslar();

 --fonksiyonlarda insert update delete gibi veri degisikligi yapan sorgular calistiramazsiniz

 -- bu tur islemler icin Stored procedure kullanabilirsiniz

 -- ancak unutmayinki sp leri select cumlesi icinde kullanamazsiniz

 -- sp konusuna gecmeden once bir fonksiyon daha tanimlatalim

 go

 --create function notuDondur(@id int) returns decimal (3,2)
 --as
 --begin
 

 --return (select mezuniyetNotu from ogrenciler where id = @id);

 --end




 go

 print dbo.notudondur(7);

