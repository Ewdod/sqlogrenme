-- ÖDEV --

Use northwind

-- SORU 1  -- Employees tablosundan , calısanlara ait ad,soyad,görev ve doğum tarihi bilgilerini listele
select FirstName  ,LastName ,Title  ,BirthDate from Employees

-- SORU 2 -- Employees tablosundaki çalışanlara ait bilgileri listelerken ünvan (TitleOfCourtesy), ad (FirstName) ve soyad (LastName) aynı sütunda olacak şekilde listeleyiniz.
select TitleOfCourtesy + FirstName + ' ' +  LastName   as [Employees] from Employees

-- SORU 3 -- Categories tablosuna CategoryName Pideler, Description 'İnce Pide Üzerinde Çeşitli Malzemelerle Pişirilerek Hazırlanmış Yemek Türü' olacak şekilde bir kayıt ekleyiniz.
--insert into Categories (CategoryName,Description) values ('Pideler' , 'İnce Pide Üzerinde Çeşitli Malzemelerle Pişirilerek Hazırlanmış Yemek Türü') 

-- SORU 4 --Shippers tablosuna MNG Kargo, 4440606 ve Yurt içi Kargo, 4449999 kayıtlarını ekleyiniz.
--insert into Shippers (CompanyName,Phone) values ('Yurt Ici Kargo' , 4449999)
--insert into Shippers (CompanyName,Phone) values ('Mng Kargo' , 4440606)

-- SORU 5 --Girdiğiniz Yurt içi Kargo kaydını Yurtiçi Kargo olarak güncelleyiniz.
update Shippers set CompanyName = 'YurtIci Kargo' where CompanyName = 'Yurt Ici Kargo' 

-- SORU 6 -- Customers (Müşteriler) tablosuna kendi bilgilerinizi içeren bir kayıt giriniz.  ----------------------------------
select * from Customers -- BU SORUYU GEÇ

-- SORU 7 --Çalışanlardan (employees) ünvanı Mr. ve Dr. olanları listeleyiniz.
select * from Employees where TitleOfCourtesy in ('Mr.','Dr.')

-- SORU 8 -- Çalışanlar tablosundaki çalışan sayısını getiriniz.
select COUNT(*) from Employees

-- SORU 9 -- Çalışanlar tablosunda kaç farklı çeşit şehirden (city) kişi bulunmaktadır. -------------------------------------
select city ,COUNT(*) as [Kisi sayisi] from Employees group by city -- TEKRAR BAK !

-- SORU 10 --Çalışanlar tablosundaki kişileri yaşlarıyla birlikte listeleyiniz.
select FirstName,(year(getdate())-year(BirthDate)) as [Yaş] from Employees

-- SORU 11 -- Çalışanlar tablosundaki kişilerin yaş ortalamasını hesaplayınız.
select AVG((year(getdate())-year(BirthDate))) as [Ortalama Yaş] from Employees
SELECT AVG(DATEDIFF(YEAR, BirthDate, GETDATE())) as [Ortalama Yaş] FROM Employees;

-- SORU 12 -- Çalışanları önce şehir, sonra ad, sonra soyada göre sıralayınız.
select * from Employees order by City 
select * from Employees order by FirstName
select * from Employees order by LastName 

-- SORU 13 --Çalışanların ad, soyad alanlarını listeleyiniz. Ve üçüncü bir alan olarak da ülkelerini USA olanları 
--"The United States of America" ve UK olanları United Kingdom olarak yazarak gösteriniz. Diğerleri için ülkeyi aynen bırakınız.
select firstName,LastName,IIF(country = 'UK' , 'United Kingdom', 'The United States of America') as [Country] from Employees
SELECT FirstName, LastName, CASE WHEN Country = 'UK' THEN 'United Kingdom' ELSE 'The United States of America' END AS Country FROM Employees;

-- SORU 14 --Customers ve Orders tabloları arasında CustomerID alanları üzerinde ilişki bulunmaktadır. 
--Tüm müşterilerin ID ve İletişim isimleriyle birlikte kaçar adet siparişte bulunduklarını listeleyiniz.
select distinct o1.CustomerID , c1.ContactName , c1.Phone , 
(select count(*) from Orders o2 where o1.CustomerID = o2.CustomerID) as [Sipariş Adet] 
from Customers c1 join Orders o1 on c1.CustomerID = o1.CustomerID 

--SORU 15 --Amerika bölgesine gönderilen siparişleri listeleyiniz.
select * from orders where ShipCountry = 'USA'

--SORU 16 --30 no'lu üründen 30'dan fazla sipariş veren müşterileri listeleyiniz.
select ProductID,Quantity,
(select contactname from customers c1 where o1.CustomerID = c1.CustomerID ) as [Müşteri Adı] 
from orders o1 join [Order Details] od2 on o1.OrderID = od2.OrderID 
where ProductID = 30 and Quantity > 30

-- SORU 17 --Soyisimleri D ile başlayan çalışanların isimlerini listeleyiniz.
select FirstName from Employees where LastName like 'D%'

--SORU 18 --Sipariş detayları tablosundaki Tofu adlı ürünle ilişkili indirim uygulanmamış tüm kayıtları getiriniz.
select p1.ProductName,o1.Discount,* from [Order Details] o1 join Products p1 on o1.ProductID = p1.ProductID where p1.ProductName = 'Tofu' and o1.Discount = 0
select * from [Order Details] where ProductID = 14

--SORU 19--Alfreds Futterkiste isimli şirketten elde edilen toplam ciroyu gösteriniz.
select CompanyName,ProductID,UnitPrice,Quantity,Discount,UnitPrice*Quantity as [Indirimsiz Hali],(UnitPrice * Quantity)  - (((UnitPrice * Quantity) * Discount)) as a3
from Customers c1 join orders o1 on c1.CustomerID = o1.CustomerID join [Order Details] o2 on o1.OrderID = o2.OrderID where c1.CustomerID = 'ALFKI'
-- ÇÖZÜM
select Format(Sum((UnitPrice * Quantity)  - (((UnitPrice * Quantity) * Discount))),'N0') as [TOPLAM CIRO HESABI]
from Customers c1 join orders o1 on c1.CustomerID = o1.CustomerID join [Order Details] o2 on o1.OrderID = o2.OrderID where c1.CustomerID = 'ALFKI'

--SORU 20 -- Amerika lokasyonlu müşterilerin vermiş olduğu siparişleri listeleyiniz.
select c1.Country as [SİPARİŞ VERİLEN ÜLKE],o1.* from orders o1  join Customers c1 on o1.CustomerID = c1.CustomerID where c1.Country = 'USA' order by c1.CustomerID

--SORU 21 --Amerika lokasyonlu çalışanların ilgilendiği siparişleri listeleyiniz.
select e1.Country as [ÇALIŞAN LOKASYONU],* from orders o1 join Employees e1 on o1.EmployeeID = e1.EmployeeID where e1.Country = 'USA' order by e1.EmployeeID

--SORU 22 --Ürünlerin isimlerini ve birim başına miktarlarını gösteren sorguyu yazınız.
select ProductName,UnitsInStock from Products

--SORU 23 --Devam etmekte olan (discontinued=false) ürünleri (product id ve name) listeleyiniz.
select ProductID,ProductName,Discontinued from Products where Discontinued = 0

--SORU 24 --Devam etmeyen (discontinued=true) ürünleri (product id ve name) listeleyiniz.
select ProductID,ProductName,Discontinued from Products where Discontinued = 1

--SORU 25 --Ürünleri en pahalıdan en ucuza doğru sıralayan sorguyu yazınız.
select * from Products order by UnitPrice desc

--SORU 26 --Devam etmekte olan ürünlerden fiyatı 20 dolardan aşağı olanları listeleyiniz.
select * from Products where Discontinued = 0 and UnitPrice <20

--SORU 27 --Birim fiyatı 15 ve 25 arasında olan devam etmekte olan ürünleri birim fiyatına göre azalan şekilde sıralayınız.
select * from Products where UnitPrice between 15 and 25 and Discontinued = 0

--SORU 28 --Fiyatı ortalama fiyatın üzerinde olan ürünleri listeleyiniz.
select * from [Products Above Average Price]
select ProductID,UnitPrice,(select AVG(UnitPrice) from Products p2 where p1.UnitPrice > AVG(p2.UnitPrice)) from Products p1 

SELECT p1.ProductID, p1.UnitPrice,
       (SELECT AVG(p2.UnitPrice) FROM Products p2 WHERE p2.UnitPrice > p1.UnitPrice)
FROM Products p1;

select AVG(UnitPrice) from Products 
select * from Products




select * from Employees
select * from EmployeeTerritories

select * from orders



select * from Customers where CompanyName = 'Alfreds Futterkiste' 
select * from orders where CustomerID = 'ALFKI'
select * from [Order Details]

select * from orders order by CustomerID
select * from Customers
select * from Shippers
select * from orders