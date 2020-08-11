create database projectGladitor

create table tbl_AircraftDetails (Airplane_no varchar(30) primary key not null,Capacity int not null, CabinType char(10) not null,Column_no int not null)
drop table tb_AircraftDetails 

create table tbl_FlightDetails(Id int identity(1,1) not null,Prefix varchar(10) default 'F',FlightId as ([Prefix] +( Cast(Id as varchar(10))))Persisted primary key not null
,TravelDays varchar(10),DeparturePoint nvarchar(20),ArrivalPoint nvarchar(20),CabinType char(10),EconomyClassFair nvarchar(10),BusinessClassFair nvarchar(10),FirstClassFair nvarchar(10),FlightStatus varchar(20))

sp_help tbl_FlightDetails
drop table tbl_FlightDetail