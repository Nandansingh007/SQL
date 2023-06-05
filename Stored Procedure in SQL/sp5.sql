--creating table

create table customer_order_history(
CustomerID int,
OrderDate datetime,
PurchaseOrderNumber nvarchar(25),
TotalDue money
);

--i/p: customerID
--o/p: customer_order_history
Go

create procedure get_order_history
@CustomerID int
as
begin
	truncate table customer_order_history;
	insert into customer_order_history
	(CustomerID, OrderDate,
	PurchaseOrderNumber, TotalDue)

	select soh.CustomerID, soh.OrderDate, soh.PurchaseOrderNumber,
	soh.TotalDue
	from SalesLT.SalesOrderHeader soh
	where soh.CustomerID = @CustomerID;

end

--calling SP
go
exec get_order_history
@CustomerID=29847

--displaying stored result in the table
select * from customer_order_history;
