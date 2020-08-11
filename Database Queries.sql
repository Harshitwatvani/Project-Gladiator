create database ProjectGladiator
Payment
create table tblSeats(SeatID varchar(10),Airplane_No varchar(40),SeatType varchar(20) not null,primary key(SeatID,Airplane_No))
drop table tblSeats
select *from tblSeats
sp_help tblSeats

create table tblTrips(ID int identity(1,1) not null,
prefix varchar(20) not null default 'TR',
TripID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,FlightID varchar(40) not null,
Airplane_No varchar(40) not null,TripDate date not null,Departure_Time time not null,Arrival_Time time not null)
select *from tblTrips
drop table tblTrips
sp_help tblTrips

create table tblBookings(ID int identity(1,1) not null,
prefix varchar(20) not null default 'B',
BID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,Booking_Date timestamp not null,
Payment_ID varchar(40) not null,[Booking Status] varchar(20) not null)
select*from tblBookings
drop table tblBookings
alter table tblBookings
alter column UserID varchar(40) not null


create table tblPayments(ID int identity(1,1) not null,
prefix varchar(20) not null default 'P',
Payment_ID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,[Payment Amount] varchar(50) not null,
[Payment Status] varchar(20) not null, [Payment date] timestamp)
select *from tblPayments
sp_help tblPayments


create table tbl_AircraftDetails (Airplane_no varchar(40) primary key not null,
Capacity int not null, CabinType char(10) not null,Column_no int not null)
drop table tbl_AircraftDetails

create table tbl_FlightDetails(Id int identity(1,1) not null,Prefix varchar(20) default 'F',FlightId as ([Prefix] +Right( Cast(Id as varchar(20)),20))Persisted primary key not null
,TravelDays varchar(10)not null,DeparturePoint nvarchar(20) not null,ArrivalPoint nvarchar(20) not null,CabinType char(10),EconomyClassFair nvarchar(10),
BusinessClassFair nvarchar(10),FirstClassFair nvarchar(10),FlightStatus varchar(20)not null)
drop table tbl_FlightDetails

create table tblpassenger_table
(
[ID] int identity(1,1) not null,
[Prefix] varchar(20) default 'PS' not null,
PassengerID AS (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,
TicketID varchar(40) not null,
PName varchar(30) not null,
Gender varchar(5) not null,
SeatID varchar(10) not null
)
drop table tblpassenger_table

create table tblTicket_table
(
[Id] int identity(1, 1) not null,
[Prefix] varchar(20) default 'T',
TicketID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,
BID varchar(40) not null,
TripID int not null,
Phone_No nvarchar(20) not null
)
drop table tblTicket_table
alter table tblTicket_table
alter column TripID varchar(40) not null

CREATE TABLE tblUser (
	[ID] [int] IDENTITY(1,1) ,
	[PreFix] [varchar](20) DEFAULT 'U',
	[UserID]  AS ([PreFix]+ RIGHT( CAST(Id AS VARCHAR(20)), 20)) PERSISTED Primary key,
    Title varchar,
    FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(30),
	DOB date NOT NULL,
	PhoneNo nvarchar(10)NOT NULL,
	Email nvarchar(50) NOT NULL,
	Password nvarchar(20)NOT NULL
);
drop table tblUser

CREATE TABLE tblAdmin (
	[ID] [int] IDENTITY(1,1),
	[PreFix] [varchar](50) DEFAULT 'A' ,
	[AdminID]  AS ([PreFix]+ RIGHT( CAST(Id AS VARCHAR(10)), 10)) PERSISTED Primary key,
    Title varchar NOT NULL,
    FullName nvarchar(30) NOT NULL,
	LastName nvarchar(30),
	PhoneNo nvarchar(10)NOT NULL,
	Email nvarchar(50)NOT NULL,
	Password nvarchar(20) NOT NULL
);
alter table tblBookings
add foreign key(Payment_ID) references tblPayments(Payment_ID)

alter table tblTicket_Table
add foreign key(BID) references tblBookings(BID)

alter table tblpassenger_Table
add foreign key(TicketID) references tblTicket_Table(TicketID)

alter table tblTrips
add foreign key(FlightID) references tbl_FlightDetails(FlightId)

alter table tblTrips
add foreign key(Airplane_No) references tbl_AircraftDetails(Airplane_No)

alter table tblSeats
add foreign key(Airplane_No) references tbl_AircraftDetails(Airplane_No)
sp_Help tblSeats

alter table tblBookings
add foreign key(UserID) references tblUser(UserID)

alter table tblTicket_table
add foreign key(TripID) references tblTrips(TripID)
