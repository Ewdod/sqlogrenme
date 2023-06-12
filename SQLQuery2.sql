use Northwind;

select EmployeeID [calisan kodu], COUNT(OrderID) [siparis sayisi] from orders group by employeeid order by count(OrderID) desc;


select Categoryid [kategori kodu] ,count(ProductID) [urun sayisi] from Products group by CategoryID order by count(ProductID) desc;

select orderid [ siparis kodu], sum(ProductID) [toplam urun] from [Order Details] group by orderid order by sum(ProductID) desc;


select productid [urun kodu], sum(quantity) [satis adedi] from [Order Details] group by ProductID order by sum(Quantity) asc;


-- aggregateler icin having normal sorgular icin where

select productid , sum(quantity) as toplam
from [Order Details]
where productid<90
group by productid
having sum(quantity) < 300
order by toplam


select productid, sum(unitprice * quantity * (1-Discount)) as [toplam] from [Order Details] group by ProductID having sum(unitprice * quantity * (1-Discount)) between 2500 and 3500 order by toplam asc;
