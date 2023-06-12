use Boost13Db;
go

create table words
(
	Id int primary key identity,
	Word NVARCHAR(100) collate Latin1_General_CI_AS not null

);
--drop table words;


