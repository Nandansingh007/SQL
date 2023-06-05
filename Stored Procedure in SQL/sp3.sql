
--o/p: top 5 most selling product in terms of quantity

--creating table
create table mostSelling(
Name nvarchar(40),
TotalQty int,
);

 Go

Alter procedure TopSelling
as
begin
truncate table mostSelling;
insert into mostSelling (Name, TotalQty)
	select top 5 p.Name, sum(sod.OrderQty) 'TotalQty'
	from SalesLT.Product p
	join SalesLT.SalesOrderDetail sod on p.ProductID=sod.ProductID
	group by p.Name
	order by sum(sod.OrderQty) desc;

end


--calling Sp
exec TopSelling;

select * from mostSelling;

