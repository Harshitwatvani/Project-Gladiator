select * from tbl_Airports

create proc proc_AirportCities
as
Begin
select city_name as [Cities] from tbl_Airports
End

exec proc_AirportCities

select * from tbl_FlightDetails