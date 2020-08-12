--- Create Table ---

CREATE TABLE tblAdmin (
    [ID] [int] IDENTITY(1,1),
    [PreFix] [varchar](20) DEFAULT 'A' ,
    [AdminID]  AS ([PreFix]+ RIGHT( CAST(Id AS VARCHAR(20)), 20)) PERSISTED Primary key,
    Title varchar(10) NOT NULL,
    FirstName nvarchar(30) NOT NULL,
    LastName nvarchar(30),
    PhoneNo nvarchar(10)NOT NULL,
    Email nvarchar(50)NOT NULL,
    Passwords nvarchar(20) NOT NULL
);

CREATE TABLE tblUser (
	[ID] [int] IDENTITY(1,1) ,
	[PreFix] [varchar](20) DEFAULT 'U',
	[UserID]  AS ([PreFix]+ RIGHT( CAST(Id AS VARCHAR(20)), 20)) PERSISTED Primary key,
    Title varchar(20),
    FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(30),
	DOB date NOT NULL,
	PhoneNo nvarchar(10)NOT NULL,
	Email nvarchar(50) NOT NULL,
	Password nvarchar(20)NOT NULL
);

create table tbl_FlightDetails
(
	Id int identity(1,1) not null,
	Prefix varchar(20) default 'F',
	FlightId as ([Prefix] +Right( Cast(Id as varchar(20)),20))Persisted primary key not null,
	TravelDays varchar(10)not null,
	DeparturePoint nvarchar(20) not null,
	ArrivalPoint nvarchar(20) not null,
	CabinType char(10),EconomyClassFair nvarchar(10),
	BusinessClassFair nvarchar(10),
	FirstClassFair nvarchar(10),
	FlightStatus varchar(20)not null
)

create table tblTicket_table
(
	[Id] int identity(1, 1) not null,
	[Prefix] varchar(20) default 'T' not null,
	TicketID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,
	BID varchar(40) not null,
	TripID int not null,
	Phone_No nvarchar(20) not null
)

create table tblPayments
(
	ID int identity(1,1) not null,
	prefix varchar(20) not null default 'P',
	Payment_ID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,
	[Payment Amount] varchar(50) not null,
	[Payment Status] varchar(20) not null, 
	[Payment date] datetime,
	Bid varchar(40)
)

create table tblBookings
(
	ID int identity(1,1) not null,
	prefix varchar(20) not null default 'B',
	UserID varchar(40) not null,
	BID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,
	Booking_Date timestamp not null,
	[Booking Status] varchar(20) not null
)

alter table tblBookings add default 'Pending' for [Booking Status]
alter table tblBookings add Booking_Date datetime not null default GETDATE()


create table tblTrips
(
	ID int identity(1,1) not null,
	prefix varchar(20) not null default 'TR',
	TripID as (prefix+RIGHT(CAST(ID as varchar(20)),20))PERSISTED primary key,
	FlightID varchar(40) not null,
	Airplane_No varchar(40) not null,
	TripDate date not null,
	Departure_Time time not null,
	Arrival_Time time not null
)

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


create table tblSeats
(
	SeatID varchar(10),
	Airplane_No varchar(40),
	SeatType varchar(20) not null,
	primary key(SeatID,Airplane_No)
)

--- ADD Foreign Key ---

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

alter table tblBookings
add foreign key(UserID) references tblUser(UserID)

alter table tblTicket_table
add foreign key(TripID) references tblTrips(TripID)

alter table tblTicket_table
add foreign key(Bid) references tblBookings(BID)

alter table tblPayments add constraint pk_Bid Foreign Key(BID) references tblBookings(BID)

---------------------------------------------------------------

----- ADD User -------
Insert into tblUser(Title, FirstName, LastName, DOB, PhoneNo, Email, Password) values('Mr', 'Ramu', 'Singh', '1998-04-08', '1234567890', 'Ramu@gmail.com', '1234')


---- ADD Aircraft Details ---------

Insert into tbl_AircraftDetails values('6E453', 60, 'EBF', 6)
Insert into tbl_AircraftDetails values('6E454', 60, 'EBF', 6)
Insert into tbl_AircraftDetails values('6E455', 60, 'EB', 6)
Insert into tbl_AircraftDetails values('6E456', 60, 'EB', 6)
Insert into tbl_AircraftDetails values('6E457', 60, 'EF', 6)
Insert into tbl_AircraftDetails values('6E458', 60, 'EF', 6)


---- ADD Flight Details ----

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1010100', 'Agatti Island Airport', 'Ahmedabad Airport', 'EBF', '4000', '5000', '4500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1000000', 'Aizawl Airport', 'Akola Airport', 'EBF', '4000', '5000', '4500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1110000', 'Amausi Airport', 'Amritsar Airport', 'EBF', '5000', '7000', '5500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('0000011', 'Bajpe Airport', 'Balurghat Airport', 'EBF', '3000', '4800', '4200', 'Active')

---- ADD Seats -----


Insert into tblSeats values ('1A', '6E453', 'B')
Insert into tblSeats values ('1B', '6E453', 'B')
Insert into tblSeats values ('1C', '6E453', 'B')
Insert into tblSeats values ('1D', '6E453', 'B')
Insert into tblSeats values ('1E', '6E453', 'B')
Insert into tblSeats values ('1F', '6E453', 'B')

---- ADD Passenger -----

insert into tblpassenger_table(TicketID, PName, Gender, SeatID) values ('T2', 'Ramu', 'Male', '1A')
insert into tblpassenger_table(TicketID, PName, Gender, SeatID) values ('T2', 'Shamu', 'Male', '2A')



---- ADD Admin ----

insert into tblAdmin(Title, FirstName, Lastname, PhoneNo, Email, Passwords)
 values('Miss', 'Aneesha', 'Sharma', '9820708734','aneesha.sharma@lntinfotech.com','Aneesha123')

insert into tblAdmin (Title, Firstname, Lastname, PhoneNo, Email, Passwords)
 values('Mr.', 'Harshit','Watwani','895842478', 'harshit.watwani@lntinfotech.com','Harshit@123')

insert into tblAdmin (Title, Firstname, Lastname, PhoneNo, Email, Passwords)
 values('Mr.', 'Prakhar','Nag','785123547', 'prakhar.nag@lntinfotech.com','Prakhar@123')

insert into tblAdmin (Title, Firstname, Lastname, PhoneNo, Email, Passwords)
values('Mr.', 'Kshitiz','Sharma','7014118553', 'kshitiz.sharma@lntinfotech.com','Kshitiz@123')


--- ADD Booking ----

Insert into tblBookings(UserID, Booking_Date) values ('U2', GETDATE());

--- ADD Payment ----

Insert into tblPayments([Payment Amount], [Payment date], BID, [Payment Status]) values ('9600', GetDate(), 'B3', 'Confirmed')


--- ADD Ticket ----

insert into tblTicket_table(BID, TripID, Phone_No) values ('B3', 'TR10', '1234567890')
