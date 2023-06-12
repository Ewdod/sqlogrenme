use Boost13Db;

-- bir tablo olusturalim

create table meyveler
(
	id int primary key identity,
	ad nvarchar(20) not null,
	yer nvarchar(50) null
);


-- veri girisi
truncate table meyveler;
insert into meyveler values(N'elma',N'amasya');
insert into meyveler values(N'kayisi',N'malatya');
insert into meyveler values(N'findik',N'giresun');
insert into meyveler values(N'cay',N'rize');
insert into meyveler values(N'pamuk',N'cukurova');
insert into meyveler values(N'gul',N'isparta');
insert into meyveler values(N'leblebi',N'corum');
insert into meyveler values(N'karpuz',N'diyarbakir');
insert into meyveler values(N'incir',N'aydin');
insert into meyveler values(N'mandalina',N'bodrum');
insert into meyveler values(N'portakal',N'antalya');
insert into meyveler values(N'Antep Fistik',N'gaziantep');
insert into meyveler values(N'seftali',N'bursa');
insert into meyveler values(N'kestane',N'bursa');
insert into meyveler values(N'Uzum',N'izmir');



select * from meyveler;

-- insert komutunda sutun belirtilmezse hepsi girilmek zorundadir





