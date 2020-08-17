import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-add-trip',
  templateUrl: './add-trip.component.html',
  styleUrls: ['./add-trip.component.css']
})
export class AddTripComponent implements OnInit {

  send:any = {};
  flights:any = {};
  planes;
  selected = '';
  data;
  constructor(private http: HttpClient) {
    this.http.get('http://localhost:64697/api/Flights').subscribe(data => {
      // this.flights = data
      this.data = data
      for(let i = 0; i < Object.keys(data).length; i++){
        this.flights[data[i].FlightID] = {}
        this.flights[data[i].FlightID].from = data[i].DeparturePoint;
        this.flights[data[i].FlightID].to = data[i].ArrivalPoint;
      }
    })

    this.http.get('http://localhost:64697/api/planes').subscribe(data => {
      this.planes = data;
    })

   }

  ngOnInit(): void {
  }

  insertDetailInfo(e){
    this.selected = e
    this.send.FlightID = e;
  }

  insertPlane(e){
    this.send.Airplane_No = e;
  }

  addTripDate(e){
    this.send.TripDate = e;
    console.log(e)
  }

  addDept(e){
    this.send.Departure_Time = e;
  }

  addArrivalTime(e){
    this.send.Arrival_Time = e;
  } 

  show(){
    this.http.post("http://localhost:64697/api/trip", this.send).subscribe(data => console.log(data))
  }
}
