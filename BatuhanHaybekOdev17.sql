use Northwind;


-- 1
select * from employees where Country = 'UK' or country = 'Turkey'


-- 2
select * from employees where region is null;

-- 3 
select * from employees where lastname = 'Fuller' or lastname = 'King';

-- 4
select * from products where (UnitPrice >15 and Discontinued = 0) or (UnitsOnOrder < 70 and ReorderLevel > 5);

--5

select productname , categoryid from products where categoryid = 1 or categoryid= 8 or categoryid= 4;

-- 6
select Address  from Suppliers where fax is null or city = 'New Orleans';

-- 7
select regionid as bolgead, regiondescription bolgetanimi from region;

-- 8
select * from [Order Details] where discount !=0 or quantity between 10 and 40;

-- 9 
select distinct Title from employees;

-- 10
select orderdate, shippeddate from orders where month(orderdate) = 8 or day(shippeddate) >15 ;

-- 11
--create database SatrancDb;
use satrancdb;

--create table Taslar(
--id  int primary key,
--ad  nvarchar(50) not null,
--hareket  nvarchar(max) not null,
--renk bit not null


--);

--insert into taslar (id,ad, hareket, renk) values(1,'Piyon', 'Bir ileri baslangic da 2 ileri gidebilir',0);
--insert into taslar (id,ad, hareket, renk) values(2,'Kale', 'dogrusal + seklinde hareket eder',0);
--insert into taslar (id,ad, hareket, renk) values(3,'At', 'L seklinde hareket eder',0);
--insert into taslar (id,ad, hareket, renk) values(4,'fil', 'Capraz sekilde x seklinde hareket eder',0);
--insert into taslar (id,ad, hareket, renk) values(5,'Vezir', 'butun yonlere sinirsiz hareket kapasitesi vardir',0);
--insert into taslar (id,ad, hareket, renk) values(6,'Sah', 'her yone bir adim ilerleme kapasitesi vardir',0);

select * from taslar;

