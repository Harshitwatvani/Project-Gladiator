create database "ABC2"

use "ABC2"

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
	DeparturePoint nvarchar(50) not null,
	ArrivalPoint nvarchar(50) not null,
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
	TripID varchar(40) not null,
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
	Booking_Date datetime not null default GETDATE(),
	[Booking Status] varchar(20) not null default 'Pending'
)


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
	SeatID varchar(10)
)


create table tblSeats
(
	SeatID varchar(10),
	Airplane_No varchar(40),
	SeatType varchar(20) not null,
	primary key(SeatID,Airplane_No)
)

create table tbl_AircraftDetails(
Airplane_no varchar(40) primary key not null,
Capacity int not null, 
CabinType char(10) not null,Column_no int not null
)

CREATE table tbl_Airports(
   IATA_code    VARCHAR(3) NOT NULL PRIMARY KEY
  ,ICAO_code    VARCHAR(4)
  ,airport_name VARCHAR(49) NOT NULL
  ,city_name    VARCHAR(14) NOT NULL
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

 alter table tblTicket_table add TicketStatus nvarchar(15)

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
values ('1010100', 'Goa', 'Ahmedabad', 'EBF', '4000', '5000', '4500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1000000', 'Udaipur', 'Indore', 'EBF', '4000', '5000', '4500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1110000', 'Amausi Airport', 'Dhanbad', 'EBF', '5000', '7000', '5500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('0000011', 'kanpur', 'Jodhpur', 'EBF', '3000', '4800', '4200', 'Active')


--- ADD TRIP Details ----- 

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F4', '6E453', '2020-08-15', '12:00', '14:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F4', '6E453', '2020-08-16', '12:00', '14:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F1', '6E454', '2020-08-10', '13:00', '15:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F1', '6E454', '2020-08-11', '12:00', '14:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F1', '6E454', '2020-08-12', '12:00', '14:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F2', '6E455', '2020-08-10', '11:00', '15:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F3', '6E454', '2020-08-10', '12:00', '14:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F3', '6E454', '2020-08-12', '10:00', '14:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F3', '6E454', '2020-08-14', '15:00', '18:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F5', '6E456', '2020-08-10', '17:00', '19:00')



---- ADD Seats -----


Insert into tblSeats values ('1A', '6E453', 'B')
Insert into tblSeats values ('1B', '6E453', 'B')
Insert into tblSeats values ('1C', '6E453', 'B')
Insert into tblSeats values ('1D', '6E453', 'B')
Insert into tblSeats values ('1E', '6E453', 'B')
Insert into tblSeats values ('1F', '6E453', 'B')

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

Insert into tblBookings(UserID, Booking_Date) values ('U1', GETDATE());



select * from tblBookings

--- ADD Payment ----

Insert into tblPayments([Payment Amount], [Payment date], BID, [Payment Status]) values ('9600', GetDate(), 'B1', 'Confirmed')


--- ADD Ticket ----

insert into tblTicket_table(BID, TripID, Phone_No) values ('B1', 'TR1', '1234567890')

update tblTicket_table set TicketStatus='Confirmed' where TicketID = 'T1'

---- ADD Passenger -----

insert into tblpassenger_table(TicketID, PName, Gender, SeatID) values ('T1', 'Ramu', 'Male', '1A')
insert into tblpassenger_table(TicketID, PName, Gender, SeatID) values ('T1', 'Shamu', 'Male', '2A')

--ADD Airports with cities-----


INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('AGX','VOAT','Agatti Island Airport','Agatti Island');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('AMD','VAAH','Ahmedabad Airport','Ahmedabad');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('AJL','VEAZ','Aizawl Airport','Aizawl');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('AKD','VAAK','Akola Airport','Akola');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXV','VEAN','Along Airport','Along');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('LKO','VILK','Amausi Airport','Lucknow');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('LUH','VILD','Amritsar Airport','Ludhiana');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXB','VEBD','Bagdogra Airport','Bagdogra');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXE','VOML','Bajpe Airport','Mangalore');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXL','VILH','Bakula Rimpoche Airport','Leh');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RGH','VEBG','Balurghat Airport','Balurghat');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXD','VIAL','Bamrauli Airport','Allahabad');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('SHL','VEBI','Barapani Airport','Shillong');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BEK','VOPN','Bareli Airport','Bareli');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BEP','VOBI','Bellary Airport','Bellary');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BLR','VOBG','Bengaluru International Airport','Bangalore');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BUP','VIBT','Bhatinda Airport','Bhatinda');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BHU','VABV','Bhavnagar Airport','Bhavnagar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BHO','VABP','Bhopal Airport','Bhopal');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BBI','VEBS','Bhubaneswar Airport','Bhubaneswar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BKB','VIBK','Bikaner Airport','Bikaner');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PAB','VABI','Bilaspur Airport','Bilaspur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXR','VERC','Birsa Munda International Airport','Ranchi');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('GAU','VEGT','Borjhar Airport','Guwahati');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('CBD','VECX','Car Nicobar Airport','Car Nicobar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXC','VICG','Chandigarh Airport','Chandigarh');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('MAA','VOMM','Chennai International Airport','Chennai');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BOM','VABB','Chhatrapati Shivaji International Airport','Mumbai');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXU','VAAU','Chikkalthana Airport','Aurangabad');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('COK','VOCI','Cochin International Airport','Kochi');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('COH','VECO','Cooch Behar Airport','Cooch Behar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('CDP','VOCP','Cuddapah Airport','Cuddapah');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('UDR','VAUD','Dabok Airport','Udaipur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('GOI','VAGO','Dabolim Airport','Goa');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('NMB','VADN','Daman Airport','Daman');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DAE','VEDZ','Daparizo Airport','Daparizo');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DAI',NULL,'Darjeeling Airport','Darjeeling');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DED','VIDN','Dehra Dun Airport','Dehra Dun');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DEP',NULL,'Deparizo Airport','Deparizo');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IDR','VAID','Devi Ahilyabai Holkar Airport','Indore');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DBD','VEDB','Dhanbad Airport','Dhanbad');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DIB','VEMN','Dibrugarh Airport','Dibrugarh');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DMU','VEMR','Dimapur Airport','Dimapur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DIU','VA1P','Diu Airport','Diu');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DHM','VIGG','Gaggal Airport','Dharamsala');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('ISK','VANR','Gandhinagar Airport','Nasik');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('GAY','VEGY','Gaya Airport','Gaya');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('GOP','VEGK','Gorakhpur Airport','Gorakhpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JGA','VAJM','Govardhanpur Airport','Jamnagar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('GUX','VAGN','Guna Airport','Guna');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('GWL','VIGR','Gwalior Airport','Gwalior');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('HSS','VIHR','Hissar Airport','Hissar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('HBX','VAHB','Hubli Airport','Hubli');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('HYD','VOHY','Hyderabad International Airport','Hyderabad');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('DEL','VIDP','Indira Gandhi International Airport','New Delhi');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JLR','VAJB','Jabalpur Airport','Jabalpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JGB',NULL,'Jagdalpur Airport','Jagdalpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JSA','VIJR','Jaisalmer Airport','Jaisalmer');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PYB','VEJP','Jeypore Airport','Jeypore');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JDH','VIJO','Jodhpur Airport','Jodhpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXH','VEKR','Kailashahar Airport','Kailashahar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXQ','VEKM','Kamalpur Airport','Kamalpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXY','VAKE','Kandla Airport','Kandla');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('KNU','VIKA','Kanpur Airport','Kanpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXK','VAKS','Keshod Airport','Keshod');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('HJR','VAKJ','Khajuraho Airport','Khajuraho');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('AGR','VIAG','Kheria Airport','Agra');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXN','VEKW','Khowai Airport','Khowai');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('KLH','VAKP','Kolhapur Airport','Kolhapur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('KTU','VIKO','Kota Airport','Kota');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('CCJ','VOCL','Kozhikode Airport','Kozhikode');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('KUU','VIBR','Kullu Manali Airport','Bhuntar Kullu.');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXS','VEKU','Kumbhirgram Airport','Silchar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXI','VELR','Lilabari Airport','Lilabari');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PNQ','VAPO','Lohegaon Airport','Pune');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXM','VOMD','Madurai Airport','Madurai');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('LDA','VEMH','Malda Airport','Malda');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('MOH','VEMN','Mohanbari Airport','Mohanbari');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IMF','VEIM','Municipal Airport','Imphal');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('MZA',NULL,'Muzaffarnagar Airport','Muzaffarnagar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('MZU','VEMZ','Muzaffarpur Airport','Muzaffarpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('MYQ','VOMY','Mysore Airport','Mysore');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('NDC','VAND','Nanded Airport','Nanded');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('CCU','VECC','Netaji Subhash Chandra Bose International Airport','Kolkata');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('NVY','VONV','Neyveli Airport','Neyveli');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('OMN',NULL,'Osmanabad Airport','Osmanabad');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PGH','VIPT','Pantnagar Airport','Pantnagar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXT','VEPG','Pasighat Airport','Pasighat');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXP','VIPK','Pathankot Airport','Pathankot');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PAT','VEPT','Patna Airport','Patna');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('CJB','VOCB','Peelamedu Airport','Coimbatore');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PNY','VOPC','Pondicherry Airport','Pondicherry');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PBD','VAPR','Porbandar Airport','Porbandar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXZ','VOPB','Port Blair Airport','Port Blair');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('PUT',NULL,'Puttaparthi Airport','Puttaparthi');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RPR','VARP','Raipur Airport','Raipur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('ATQ','VIAR','Raja Sansi Airport','Amritsar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RJA','VORY','Rajahmundry Airport','Rajahmundry');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RAJ','VARK','Rajkot Airport','Rajkot');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RJI',NULL,'Rajouri Airport','Rajouri');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RMD',NULL,'Ramagundam Airport','Ramagundam');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RTC','VARG','Ratnagiri Airport','Ratnagiri');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('REW',NULL,'Rewa Airport','Rewa');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RRK','VERK','Rourkela Airport','Rourkela');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JRH','VEJT','Rowriah Airport','Jorhat');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BHJ','VABJ','Rudra Mata Airport','Bhuj');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('RUP','VERU','Rupsi Airport','Rupsi');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('SXV','VOSM','Salem Airport','Salem');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TEZ','VETZ','Salonibari Airport','Tezpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXG','VABM','Sambre Airport','Belgaum');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('JAI','VIJP','Sanganeer Airport','Jaipur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TNI','VIST','Satna Airport','Satna');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXJ','VIJU','Satwari Airport','Jammu');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('SSE','VASL','Sholapur Airport','Sholapur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('SLV','VISM','Simla Airport','Simla');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXA','VEAT','Singerbhil Airport','Agartala');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('IXW','VEJS','Sonari Airport','Jamshedpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('NAG','VANP','Sonegaon Airport','Nagpur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('SXR','VISR','Srinagar Airport','Srinagar');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('STV','VASU','Surat Airport','Surat');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TEI','VETJ','Tezu Airport','Tezu');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TJV','VOTJ','Thanjavur Airport','Thanjavur');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TRV','VOTV','Thiruvananthapuram International Airport','Trivandrum');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TIR','VOTP','Tirupati Airport','Tirupati');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TRZ','VOTR','Trichy Airport','Trichy');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('TCR',NULL,'Tuticorin Airport','Tuticorin');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('BDQ','VABO','Vadodara Airport','Vadodara');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('VNS','VIBN','Varanasi Airport','Varanasi');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('VGA','VOBZ','Vijayawada Airport','Vijayawada');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('VTZ','VEVZ','Vishakhapatnam Airport','Vishakhapatnam');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('WGC','VOWA','Warangal Airport','Warangal');
INSERT INTO tbl_Airports(IATA_code,ICAO_code,airport_name,city_name) VALUES ('ZER','VEZO','Zero Airport','Zero');



select * from tblUser


select * from  tblSeats
select * from  tblBookings
select * from tblPayments
select * from  tblTrips
select * from  tbl_FlightDetails
select * from tbl_AircraftDetails

select * from tblTicket_table
select * from tblpassenger_table 

select * from tbl_Airports order by airport_name 

drop table tbl_FlightDetails
drop table tbl_AircraftDetails



-----prakhar---------------------

create proc proc_FlightSelect(@from nvarchar(50),@to nvarchar(50),@deptdate date,@returndate date,@PassengerCount int)
as
	
	Begin
		select aircraft.Airplane_no ,tt.TripID ,tt.Departure_Time,tt.Arrival_Time,fd.EconomyClassFair,fd.BusinessClassFair,fd.FirstClassFair
		from tbl_FlightDetails fd Inner Join tblTrips tt 
		on fd.FlightId = tt.FlightId
		Inner Join tbl_AircraftDetails aircraft on aircraft.Airplane_no=tt.Airplane_No
		where fd.DeparturePoint=@from AND fd.ArrivalPoint=@to  AND  tt.TripDate=@deptdate
		AND 
		@PassengerCount<=(
					select aircraft.Capacity-Count(pass.PassengerID) as [PassCount]
					from tbl_AircraftDetails aircraft Inner Join tblTrips trips on aircraft.Airplane_no=trips.Airplane_No
					Inner Join tblTicket_table tr on trips.TripID=tr.TripID Inner Join tblpassenger_table pass
					on tr.TicketID =pass.TicketID 
					where fd.DeparturePoint=@from AND fd.ArrivalPoint=@to  AND  tt.TripDate=@deptdate
					group by aircraft.Capacity

				)		
		End


		drop proc proc_FlightSelect

	exec  proc_FlightSelect 'Jaipur','Warangal','2020-08-10','2020-08-10',29
	exec  proc_FlightSelect 'Warangal','Jaipur','2020-08-10','2020-08-25',29


	delete from tbl_FlightDetails

	Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1010100', 'Goa', 'Ahmedabad', 'EBF', '4000', '5000', '4500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1000000', 'Udaipur', 'Indore', 'EBF', '4000', '5000', '4500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('1110000', 'Amausi Airport', 'Dhanbad', 'EBF', '5000', '7000', '5500', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('0000011', 'kanpur', 'Jodhpur', 'EBF', '3000', '4800', '4200', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('0001111', 'Jaipur', 'Warangal', 'EBF', '3000', '4800', '4200', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('0001111', 'Warangal', 'Jaipur', 'EBF', '3000', '4800', '4200', 'Active')

Insert into tbl_FlightDetails
(TravelDays, DeparturePoint, ArrivalPoint, CabinType, EconomyClassFair, BusinessClassFair, FirstClassFair, FlightStatus)
values ('0001111', 'Warangal', 'Jaipur', 'EBF', '3000', '4800', '4200', 'Active')


update tbl_FlightDetails set DeparturePoint='kanpur' where FlightId ='F4'
update tbl_FlightDetails set ArrivalPoint='Jodhpur'where FlightId ='F4'

update tbl_FlightDetails set DeparturePoint='Goa' where FlightId ='F3'
update tbl_FlightDetails set ArrivalPoint='Ahemdabad'where FlightId ='F3'

update tbl_FlightDetails set DeparturePoint='Amritsar' where FlightId ='F2'
update tbl_FlightDetails set ArrivalPoint='Raipur'where FlightId ='F2'

update tbl_FlightDetails set DeparturePoint='Jaipur' where FlightId ='F1'
update tbl_FlightDetails set ArrivalPoint='Warangal'where FlightId ='F1'



 alter table tblTicket_table add TicketStatus nvarchar(15)

 
Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F5', '6E456', '2020-08-10', '17:00', '19:00')

Insert into tblTrips(FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time) 
values ('F6', '6E456', '2020-08-25', '19:00', '21:00')

Insert into tblUser(Title, FirstName, LastName, DOB, PhoneNo, Email, Password) values('Mr', 'Prakhar', 'Nag', '1998-01-22', '7412588520', 'prakhar@gmail.com', '1234')

insert into tblBookings(UserID) values('U2');

update tblTicket_table set TicketStatus='Confirmed' where TicketID = 'T1'

alter table tblTicket_table add constraint ticketstat DEFAULT 'Pending'  FOR TicketStatus 


select * from tbl_FlightDetails

select * from tblBookings
select * from tblTicket_table


insert into tblTicket_table(BID, TripID) values ('B4', 'TR3')

--delete from tblTicket_table where Id=3 



create proc proc_Booking(@userID varchar(40))
as
Begin 
	insert into tblBookings(UserID) values(@userID)
End

exec proc_Booking 'U2'
select * from tblBookings

create proc proc_GetBookings(@userID varchar(40))
as
Begin
	select TOP 1 UserID ,BID,Booking_Date,[Booking Status] from tblBookings where UserID=@userID order by Booking_Date desc 
End

exec proc_GetBookings 'U1'

create proc proc_TicketBook(@BID varchar(40),@TripID varchar(40))
as
Begin
	insert into tblTicket_table(BID,TripID) values(@BID,@TripID)
End

exec proc_TicketBook 'B5','TR7'


select * from  tblTrips
select * from  tblBookings
select * from tblTicket_table

delete from tblTicket_table where BID='B4'




