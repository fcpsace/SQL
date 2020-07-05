
--/* Hisham Madkour Assignment 1.*/


--Q1 Create a new Database called MyDB_StudentName (drop it and re-add it if already exists)
USE master
IF DB_ID('MyDB_StudentName') IS NOT NULL
BEGIN
ALTER DATABASE MyDB_StudentName SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE MyDB_StudentName SET ONLINE;
DROP DATABASE MyDB_StudentName;
END

create database MyDB_StudentName;
use MyDB_StudentName
GO

-- Q2 Copy all records and columns from chinook.DboCustomer table into 

select * into Users
from Chinook.dbo.Customer

-- Q3 Delete all records from the users table that have an odd customerID number
delete Users
where CustomerId %2 !=0



--Q4 Update company column if the user email is gmail, company should be google, if user email is yahoo, company should be Yahoo! and else should be current value of company
--NOT WORKING
--UPDATE Users
--set company
--CASE 
--when (CHARINDEX('gmail', email > 0)) then 'Google'
--when (CHARINDEX('yahoo', email > 0)) then 'Yahoo'

--Q5 Rename the  CustomerID column to UserID
exec sp_rename 'users.CustomerID' , 'UserID', 'COLUMN'


-- Q6 Set UserID columnn as primary Key in the users Table
use MyDB_StudentName
alter table users
add constraint pk_users primary key (UserID)


-- Q7 create an address table
use MyDB_StudentName
CREATE TABLE Address(
AddressID int IDENTITY(1,1) PRIMARY KEY,
AddressType varchar(10),
AddressLine1 varchar(50),
City varchar(30),
State varchar(2),
UserID int,
CreateDate datetime DEFAULT GETDATE(),
)


--Q8 Add a unique constraint to the address table prohibiting duplicate combinations of userId and addresstype columns

ALTER TABLE Address
Add CONSTRAINT uc_addressType UNIQUE(AddressType, userID)


--Q9 Add UserID as foreign key to the address table referencing Primary key UserID in Users Table
ALTER TABLE ADDRESS
   ADD CONSTRAINT fk_UserAddress FOREIGN KEY (UserID)
      REFERENCES Users(UserID)
      
      
;


--Q10 insert 3 records into the address table

INSERT INTO Address (AddressType, AddressLine1, City, State, UserID)
VALUES  ('home', '111 Elm St.', 'Los Angeles', 'CA', 2),
		('home', '222 Palm Ave.', 'San Diego', 'CA', 4),
		('work', '333 Oak Ln.', 'La Jolla', 'CA', 4)
		
-- Q11 Select all records from the address and user tables
-- hint 32 records should be returned

SELECT * from Address
SELECT * from Users



