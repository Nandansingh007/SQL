use AdventureWorksLT2019;

select count(distinct ProductCategoryID) from SalesLT.Product;
select count(distinct ProductCategoryID) from SalesLT.ProductCategory;

--2.sp that retrieves total sales for each product category
--output: total sales 

--creating table for input
create table TotalSaleForEachProductCategory(
ProductCategoryID int,
Name nvarchar(30),
TotalQuantity int
);

 GO

create procedure TotalSales
as

begin

truncate table TotalSaleForEachProductCategory;

--inserting into the table 
insert into TotalSaleForEachProductCategory
select p.ProductCategoryID, pc.Name, sum(sod.OrderQty)
'TotalQuantity'
from SalesLT.Product p
join SalesLT.ProductCategory pc on
p.ProductCategoryID=pc.ProductCategoryID
join SalesLT.SalesOrderDetail sod on sod.ProductID=p.ProductID
group by p.ProductCategoryID, pc.Name;

end

--calling SP
exec TotalSales;

select * from TotalSaleForEachProductCategory;