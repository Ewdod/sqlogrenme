use Boost13Db;


declare @a int = 0;
declare @b int = 1;
declare @toplam int;


declare @sayilar table
(
	sayi int not null
);

while @a < 1000
begin

	insert into @sayilar(sayi) values(@a);
	
	set @toplam = @a +@b;
	set @a = @b;
	set @b = @toplam;



end

select * from @sayilar;
