--create Table
create table salesforproductforgivenmonth(
Name nvarchar(50),
SalesMonth int,
TotalSales numeric(38, 6)
);


--o/p: total sales
Go

Alter PROCEDURE total_sales_of_products_for_given_month


AS
BEGIN

SET NOCOUNT ON;

truncate table salesforproductforgivenmonth
insert into salesforproductforgivenmonth
(Name, SalesMonth,
TotalSales)

	select p.Name, month(soh.OrderDate) 'SalesMonth',
	sum(soh.SubTotal) 'TotalSales'
	from SalesLT.Product p
	join SalesLT.SalesOrderDetail sod on p.ProductID=sod.ProductID
	join SalesLT.SalesOrderHeader soh on
	sod.SalesOrderID=soh.SalesOrderID
	group by p.Name, MONTH(soh.OrderDate)
	--order by SalesMonth, p.Name;
	order by 3 desc

END

--calling SP
go
exec total_sales_of_products_for_given_month ;

--displaying results
select * from salesforproductforgivenmonth;
