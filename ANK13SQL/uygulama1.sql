use Boost13Db

select * from Ogrenciler;

--1
select * from ogrenciler where CovidGecirdiMi = 1;

--2
select * from ogrenciler where kangrubu = N'a+' and cinsiyet = N'e';

--3
select * from ogrenciler where MONTH(DogumTarihi) = 9;

--4
select * from ogrenciler where soyad  like N'%z%';

--5
select * from ogrenciler where id in (1,3,7,12);

--6
select *,  case when evlimi = 1 then N'evli' when evlimi = 0 then  N'bekar' else N'' end from Ogrenciler;

--7
select * from ogrenciler where kangrubu like N'%-' or kangrubu like N'0%';

--8
select concat(left(ad,1),left(soyad,1)) from Ogrenciler;
select *,  concat(left(ad,1),left(soyad,1)) from ogrenciler;

--9
select * from ogrenciler where len(ad) = len(Soyad);

--10
select * from ogrenciler order by cinsiyet desc, MezuniyetNotu asc;