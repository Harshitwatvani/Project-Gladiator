create database flightReservation

use flightReservation

CREATE TABLE user_tbl (
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PreFix] [varchar](50) DEFAULT 'U' NOT NULL,
	[UserID]  AS ([PreFix]+ RIGHT('0000000' + CAST(Id AS VARCHAR(7)), 7)) PERSISTED Primary key,
    Title varchar,
    FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(30),
	DOB date NOT NULL,
	PhoneNo nvarchar(10)NOT NULL,
	Email nvarchar(50) NOT NULL,
	Password nvarchar(20)NOT NULL
);

select * from user_tbl


CREATE TABLE admin_tbl (
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PreFix] [varchar](50) DEFAULT 'A' NOT NULL,
	[AdminID]  AS ([PreFix]+ RIGHT('0000000' + CAST(Id AS VARCHAR(7)), 7)) PERSISTED Primary key,
    Title varchar NOT NULL,
    FullName nvarchar(30) NOT NULL,
	LastName nvarchar(30),
	PhoneNo nvarchar(10)NOT NULL,
	Email nvarchar(50)NOT NULL,
	Password nvarchar(20) NOT NULL
);

select * from admin_tbl







