create proc planeSeats(@Plane_no varchar(40))
as
	Select SeatID, SeatType from tblSeats where Airplane_No = @Plane_no order by SeatID

exec planeSeats '6e454'

create proc passengerInfo
as
	Select SeatID from tblpassenger_table 

exec passengerInfo

exec planeSeats '6e453'

create proc planeInfo(@planeID varchar(40))
as
	Select Airplane_no, Capacity, Column_no from tbl_AircraftDetails where Airplane_no = @planeID

exec planeInfo '6e453'


create proc planeSeatInfo(@tripId varchar(40))
as
	Select tp.SeatID from tblTrips tr inner join tblTicket_table ti on tr.TripID = ti.TripID 
	inner join tblpassenger_table tp on ti.ticketid = tp.ticketid where tr.tripId = @tripId order by tp.seatid


exec planeSeatInfo 'tr10'
 
create proc SeatPrice(@TripID varchar(40))
as
	Select BusinessClassFair, EconomyClassFair, FirstClassFair  from tbl_FlightDetails where FlightId = (Select FlightId from tblTrips where TripID = @TripID)

exec SeatPrice 'TR10'

create proc flightDetails
as
	Select FlightID, DeparturePoint, ArrivalPoint from tbl_FlightDetails order by Id desc

exec flightDetails

create proc locations
as
	Select city_name from tbl_Airports

exec locations

create proc time(@Flight varchar(40))
as
	Select top 1 Departure_Time, Arrival_Time from tblTrips where FlightID = @Flight order by TripDate

exec time 'F10'

create proc planes
as
	Select Airplane_no from tbl_AircraftDetails

create proc addTrip(@FlightID varchar(40), @Airplane_No varchar(40), @TripDate date, @DepTime time, @Arrival_Time time)
as
	Insert into tblTrips(FlightID, Airplane_No, TripDate,Departure_Time, Arrival_Time) values (@FlightID, @Airplane_No, @TripDate, @DepTime, @Arrival_Time)

create proc allTrips
as
	Select TripID from tblTrips

create proc createTrip(@TripID nvarchar(40), @Airplane_No nvarchar(40), @DeptTime time, @ArrivalTime time)
as
	update tblTrips set Airplane_No = @Airplane_No, Arrival_Time = @ArrivalTime, Departure_Time = @DeptTime where tripID = @TripID 

exec createTrip 'TR10', '6E454', '12:00:00', '14:00:00'

select * from tblTrips



create proc TripByID(@TripID varchar(40))
as
	Select TripID, FlightID, Airplane_No, TripDate, Departure_Time, Arrival_Time from tblTrips where tripID = @TripID

exec TripByID 'TR10'