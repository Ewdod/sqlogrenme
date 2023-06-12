use Boost13Db;

-- bir fonksiyonda bir select sorgusunun sonucunu dondurebilir ancak direk sorgulayamayiz

-- bunun icin de splere ihtiyac duyariz

-- verilen harfi iceren ogrencileri sorgulayan sp


go

create procedure spIcerenogrenciler @ara nvarchar(max)

as
select * from ogrenciler where ad like N'%'+@ara+ N'%' or soyad like N'%'+@ara+ N'%';

go


execute spIcerenogrenciler N'a';


 go

 -- verilen araliktaki id lere sahip olan ogrencileri sorgula

 create procedure spidlerarasinda @x int, @y int

as
select * from ogrenciler where id between @x and @y;

go



 exec spidlerarasinda 3,7;

 go



 go

  -- aldigi ad , soyad ve cinsiyet parametrelerine uygun olarak ogrenciler tablosuna ogrenci ekleyen sp tanimla

 -- create procedure spogrenciekle @ad nvarchar(max), @soyad nvarchar(max), @cinsiyet nvarchar(1) 
 -- as
 -- insert into ogrenciler (ad,Soyad,Cinsiyet) values (@ad,@soyad,@cinsiyet);
  
  


 go


 exec spogrenciekle N'Abuzer', N'Kadayif', N'e'

 select * from ogrenciler;


 go

 create procedure spogrencisil @id int
 as
 begin
 delete from ogrenciler where id = @id;
 end
 go

 exec spogrencisil 13;

 go
 create proc spuzunluktersi @metin nvarchar(max),@uzunluk int out, @tersi nvarchar(max) out

 as 
 set @uzunluk = len(@metin);
 set @tersi = reverse(@metin);

 go


 declare @tabak1 int;
 declare @tabak2  nvarchar(max);
 exec spuzunluktersi N'Abuzer', @tabak1 out, @tabak2 out;
 print @tabak1;
 print @tabak2;


 -- once sorgularimizda tanimladigimiz sp yardimiyla 3 tane ogrenci ekle 


 --id si 12 den buyuk olan ogrencileri sil

 -- bir ogrenci daha ekledigimizde  13 den baslayarak otomatik atamasini nasil yapariz

 exec spogrenciekle N'ad',N'soyad',N'e'
 exec spogrenciekle N'ad',N'soyad',N'e'
 exec spogrenciekle N'ad',N'soyad',N'e'

 select * from ogrenciler;

 exec spogrencisil 13 ;
 exec spogrencisil 14 ;
 exec spogrencisil 16;

 -- burasi baya onemli
 dbcc checkident('Ogrenciler', Reseed,12);

 -- ben kafam gore id girmek istiyorum mumkunmu

 set identity_insert ogrenciler on; 

 --bu ikisi arasinda yapmak istediginizi yapabilirsiniz

 set identity_insert ogrenciler off;