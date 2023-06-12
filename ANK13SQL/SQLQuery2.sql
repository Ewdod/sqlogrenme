use Boost13Db;

CREATE TABLE Harfler (    
    harf NCHAR(1) primary key
);

-- a dan  zye 28 harf vardir

---- 26 tane ingilizce harfi bir donguyle tabloya ekle
--declare @i int = unicode(N'A');
--while @i <+ unicode(N'Z')
--begin
--	insert into harfler values (nchar(@i))
--	set @i +=1;
--end

--	select * from harfler;


--truncate table harfler;

select * from harfler;

-- Türkçe harfleri içeren verileri ekle 
--INSERT INTO Harfler (Harf) VALUES (N'A'); 
--INSERT INTO Harfler (Harf) VALUES (N'B'); 
--INSERT INTO Harfler (Harf) VALUES (N'C'); 
--INSERT INTO Harfler (Harf) VALUES (N'Ç'); 
--INSERT INTO Harfler (Harf) VALUES (N'D'); 
--INSERT INTO Harfler (Harf) VALUES (N'E'); 
--INSERT INTO Harfler (Harf) VALUES (N'F'); 
--INSERT INTO Harfler (Harf) VALUES (N'G'); 
--INSERT INTO Harfler (Harf) VALUES (N'Ğ'); 
--INSERT INTO Harfler (Harf) VALUES (N'H'); 
--INSERT INTO Harfler (Harf) VALUES (N'I'); 
--INSERT INTO Harfler (Harf) VALUES (N'İ'); 
--INSERT INTO Harfler (Harf) VALUES (N'J'); 
--INSERT INTO Harfler (Harf) VALUES (N'K'); 
--INSERT INTO Harfler (Harf) VALUES (N'L'); 
--INSERT INTO Harfler (Harf) VALUES (N'M'); 
--INSERT INTO Harfler (Harf) VALUES (N'N'); 
--INSERT INTO Harfler (Harf) VALUES (N'O'); 
--INSERT INTO Harfler (Harf) VALUES (N'Ö'); 
--INSERT INTO Harfler (Harf) VALUES (N'P'); 
--INSERT INTO Harfler (Harf) VALUES (N'R'); 
--INSERT INTO Harfler (Harf) VALUES (N'S'); 
--INSERT INTO Harfler (Harf) VALUES (N'Ş'); 
--INSERT INTO Harfler (Harf) VALUES (N'T'); 
--INSERT INTO Harfler (Harf) VALUES (N'U'); 
--INSERT INTO Harfler (Harf) VALUES (N'Ü'); 
--INSERT INTO Harfler (Harf) VALUES (N'V'); 
--INSERT INTO Harfler (Harf) VALUES (N'Y'); 
--INSERT INTO Harfler (Harf) VALUES (N'Z');


INSERT INTO Harfler (Harf) VALUES (N'A'), (N'B'), (N'C'), (N'Ç'), (N'D'), (N'E'), (N'F'),
(N'G'), (N'Ğ'), (N'H'), (N'I'), (N'İ'), (N'J'), (N'K'), (N'L'), (N'M'), (N'N'),
(N'O'), (N'Ö'), (N'P'), (N'R'), (N'S'), (N'Ş'), (N'T'), (N'U'), (N'Ü'), (N'V'), (N'Y'), (N'Z');




select * from harfler;


