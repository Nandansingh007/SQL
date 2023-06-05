use AdventureWorksLT2019;

select * from SalesLT.SalesOrderHeader;

--1. creating SP that retrives orders placed by a particular customer within a given data range
--input: customerid, startdate, enddate

Go

CREATE PROCEDURE retrieve_orders
@Start_Date DATETIME,
@End_Date DATETIME,
@CusomterId int
AS

BEGIN

SELECT c.CustomerID, s.SalesOrderId, s.salesOrderNumber, s.OrderDate
FROM SalesLT.Customer c
inner join SalesLT.SalesOrderHeader s
ON c.CustomerID = s.CustomerID
WHERE c.CustomerID = @CusomterId AND s.OrderDate BETWEEN @Start_Date AND @End_Date;

END;

--calling the SP
Execute retrieve_orders @Start_Date='2002-01-01 00:00:00' , @End_Date= '2020-01-01 00:00:00', @CusomterId = 29847;





