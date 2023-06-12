USE master;
GO
CREATE DATABASE Boost13Db;
GO

USE Boost13Db;
GO

CREATE TABLE Ogrenciler
(
	Id INT PRIMARY KEY IDENTITY,
	Ad nvarchar(50) not null,
	Soyad nvarchar(50) not null,
	Cinsiyet NVARCHAR(1) NOT NULL,
	DogumTarihi DATE NULL, -- yazmaz isek defaultu null dir sadece bunun degil hepsinin 
	EvliMi BIT NULL,
	MezuniyetNotu DECIMAL(3,2) NULL, -- 3 basamakli 2 basamagi virgulden sonraki hanesine ayrilmis durumda orada ki 2 bu anlama geliyor
	KanGrubu NVARCHAR(3) NULL,
	CovidGecirdiMi BIT Null
);
GO

INSERT INTO Ogrenciler(Cinsiyet, DogumTarihi, EvliMi, MezuniyetNotu, CovidGecirdiMi, KanGrubu, Ad, Soyad)
VALUES
(N'k', N'1997-04-17', 0, 2.96, 1, N'b-', N'İrem', N'Cengiz'),
(N'e', N'1996-09-26', 0, 2.29, 0, N'a+', N'Serdar', N'Ünlü'),
(N'e', N'1993-02-25', 1, 2.93, 1, N'0+', N'Yasin', N'Gürbüz'),
(N'k', N'1993-05-02', 1, 3.02, 0, N'0+', N'Gamze', N'Güzle Obuz'),
(N'e', N'1995-08-17', 0, 2.44, 0, N'a+', N'Taylan', N'Saykan'),
(N'e', N'1995-09-01', 0, 2.92, 1, N'a+', N'Sinan', N'Taşyapar'),
(N'e', N'1998-09-13', 0, 2.75, 0, N'a-', N'Batuhan', N'Haybek'),
(N'e', N'1995-11-02', 0, 2.60, 0, N'a+', N'Ozan', N'Genç'),
(N'e', N'1997-06-21', 0, 2.48, 1, N'a-', N'Doğukan', N'Aslan'),
(N'k', N'1996-05-10', 1, 2.52, 0, N'0-', N'Ceren', N'Şen Yazıcı'),
(N'e', N'1991-09-10', 1, 2.44, 1, N'a-', N'Emrah', N'Sözlü'),
(N'e', NULL, NULL, NULL, NULL, NULL, N'Kızıltan', N'Oral');
GO

SELECT * FROM Ogrenciler;
--DELETE From Ogrenciler; -- bu tabloyu siliyor ancak sifirlamiyor id leri en son 3 se yeni eklenecek olani 4 den devam ettiriyor

--TRUNCATE Table Ogrenciler;  bir tabloyu tamamen siliyor ve sifirliyor