--creating table

create table customer_information(
CustomerID int,
FirstName nvarchar(50),
MiddleName nvarchar(50),
LastName nvarchar(50),
Gender nvarchar(10)
);

--i/p: customer Id
--o/p: customer information
Go

create procedure get_demography
@CID int
as
begin

truncate table customer_information;
insert into customer_information
(CustomerID, FirstName, MiddleName,
LastName, Gender)

select CustomerID, FirstName, MiddleName, LastName,
case when Title = 'Mr.' then 'M'
when Title = 'Ms.' then 'F'

else 'Unknown'
end 'Gender'
from SalesLT.Customer
where CustomerID=@CID;
end

go

--calling sp
exec get_demography
@cid=29847

--displaying results
select * from customer_information;