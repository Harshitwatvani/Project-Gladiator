create proc proc_FlightSelect(@oneway int,@roundtrip int,@from nvarchar(50),@to nvarchar(50),@deptdate dateTime,@returndate datetime,@PassengerCount int)
as
	if(@oneway=1)
	Begin
		select aircraft.Airplane_no as[Plane No] ,tt.Departure_Time,tt.Arrival_Time,fd.EconomyClassFair,fd.BusinessClassFair,fd.FirstClassFair
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

	exec  proc_FlightSelect 1,1,'Bajpe Airport','Balurghat Airport','2020-08-15','2020-08-10',29






