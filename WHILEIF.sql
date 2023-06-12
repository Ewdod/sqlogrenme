

-- 1 den 10 a kadar olan sayilari yazdir ancak 6 sayisini yazdiktan hemen sonra ankara yaz

declare @i int = 1;

while @i <=10
begin
	
	print @i;
	if @i = 6
		print N'ankara';

	set @i +=1;


end