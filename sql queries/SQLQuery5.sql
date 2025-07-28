select * from Accounts

select * from Customers

select * from Transactions

select * from INFORMATION_SCHEMA.columns  where TABLE_NAME like 'Transactions'
select * from INFORMATION_SCHEMA.columns  where TABLE_NAME like 'Customers'
select * from INFORMATION_SCHEMA.columns  where TABLE_NAME like 'Accounts'