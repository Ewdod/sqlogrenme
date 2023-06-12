use Boost13Db;

-- bir degiskende tasimak uzere tek sutunlu bir tablo olustur 
declare @sayilar table 
(
	sayi int
);



-- sutun int turunde olacak


-- bir dongu kullanarak  1- 100 araliginda 20 sayi tabloya ekle

declare @count int = 0;

while (@count < 20)
begin
	insert into @sayilar(sayi) values (floor(Rand() * 100) +1)      
    set @count = @count + 1;        
end;

select * from @sayilar;



--3 sayilari kucukten buyuge sirali sorgula
select * from @sayilar order by sayi asc;

-- 4 kac adet sayi 50 den buyuktur
select count(sayi) as [50 den buyuk olanlar] from @sayilar where sayi >50;

-- soru 4 chatgpt

SELECT SUM(CASE WHEN sayi > 50 THEN 1 ELSE 0 END) AS [50 den buyuk olanlar]
FROM @sayilar;
select count(case when sayi > 50 then 1 end)  from @sayilar;
select count(*) from @sayilar where sayi >50;

--5 en buyuk ve en kucuk sayi kactir
select max(sayi) as [en buyuk sayi],min(sayi) as [en kucuk sayi] from @sayilar;
-- 6 sayilarin ortalamasi

select avg(sayi) as ortalama from @sayilar;

 -- 7 ilk uc sayi select top 3

 select top 3 sayi as [ilk uc sayi] from @sayilar;


