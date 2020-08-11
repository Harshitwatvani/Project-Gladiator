create table passenger_table
(
[ID] int identity(1,1) not null,
[Prefix] nvarchar(5) default 'PS' not null,
PassengerID AS ([Prefix] + Cast(ID as nvarchar(10))) persisted primary key,
TicketID int not null,
PName nvarchar(30) not null,
Gender varchar(5) not null,
SeatID varchar(10) not null
)

create table Ticket_table
(
[Id] int identity(1, 1) not null,
[Prefix] nvarchar(2) default 'T',
TicketID as ([Prefix] + Cast(Id as nvarchar(10))) persisted primary key,
BID nvarchar() not null,
TripID int not null,
Phone_No nvarchar(20) not null
)

Insert into Ticket_table(Bid, TripID, Phone_No) values(12, 32, 'asvnklavsa')

Select * from Ticket_table

