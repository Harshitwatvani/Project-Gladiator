import { Component, OnInit } from '@angular/core';
import { SeatSelectServices } from '../Services/SeatsSelectService';
import { HttpClient } from '@angular/common/http';
import { RouterLink, Router } from '@angular/router';

@Component({
  selector: 'app-roundtrip-seat-book',
  templateUrl: './roundtrip-seat-book.component.html',
  styleUrls: ['./roundtrip-seat-book.component.css']
})

export class RoundtripSeatBookComponent implements OnInit {
  prefixClass = {}
  seatObject = {};
  info:any = {};
  rows;
  columns;
  totalFare = 0;
  selectedSeats = {};
  seatCount = 0;
  count;

  seatObject1 = {};
  info1:any = {};
  rows1;
  columns1;
  selectedSeats1 = {};
  seatCount1 = 0;
  count1;
  totalFare1 = 0;

  overallFare = 0;
  
  constructor(public seatSer: SeatSelectServices, private http: HttpClient, private router: Router) {
    this.prefixClass = {
      B : "BusinessClassFair",
      E : "EconomyClassFair",
      F : "FirstClassFair"
    }

    this.count = this.seatSer.passengerNumber;

    this.info = {};
    if(this.seatSer.planeId && this.seatSer.tripId ){
      
      this.http.get('http://localhost:64697/api/Plane/' + this.seatSer.planeId).subscribe(data => {
          this.info.airplaneInfo = data
          this.http.get('http://localhost:64697/api/Seat/' + this.seatSer.planeId).subscribe(data => {
            this.info.Seats = data;
            this.http.get('http://localhost:64697/api/Passenger/' + this.seatSer.tripId).subscribe(data => {
              this.info.passengerSeats = data;
              this.http.get('http://localhost:64697/api/SeatPrice/' + this.seatSer.tripId).subscribe(data => {
                this.info.SeatPrice = data;
                this.rows = new Array(Math.ceil(this.info.airplaneInfo.Capacity / this.info.airplaneInfo.Column_no));
                this.columns = new Array(this.info.airplaneInfo.Column_no);

                for(let i = 0; i < this.rows.length; i++){
                  this.rows[i] = i + 1;
                }

                for(let j = 0; j< this.columns.length; j++){ 
                  this.columns[j] = String.fromCharCode(65 + j);
                }

                // this.rows = [1]
                // this.columns = ['A', 'B', 'C', 'D', 'E', 'F']
                
                // for(var seat of this.info.passengerSeats){
                //   for(let idx = 0; idx < this.info.Seats.length; idx++){
                //     if(this.info.Seats[idx].SeatID === seat){
                //       this.info.Seats[idx].disabled = true
                //       break;
                //     }
                //   }
                // }
                //{ "airplaneInfo": [ { "Airplane_no": "6E453", "Capacity": 60, "Column_no": 6 } ], 
                //"Seats": [ { "SeatID": "1A", "SeatType": "B" } ], "passengerSeats": [ "1A", "2A" ] }
                for(let i = 0; i < this.info.Seats.length; i++){
                  this.seatObject[this.info.Seats[i].SeatID] = {
                    type : this.info.Seats[i].SeatType,
                    price : this.info.SeatPrice[this.prefixClass[this.info.Seats[i].SeatType]]
                  }
                }

                for(var pSeat of this.info.passengerSeats){
                  this.seatObject[pSeat].booked = true
                }
              })
            });
          });
      });
    }

    this.count1 = this.seatSer.passengerNumber;

    this.info1 = {};

    if(this.seatSer.planeId && this.seatSer.tripId ){

      this.http.get('http://localhost:64697/api/Plane/' + this.seatSer.planeId1).subscribe(data => {
          // console.log(data)
          this.info1.airplaneInfo = data;
          this.http.get('http://localhost:64697/api/Seat/' + this.seatSer.planeId1).subscribe(data => {
            this.info1.Seats = data;
            this.http.get('http://localhost:64697/api/Passenger/' + this.seatSer.tripId1).subscribe(data => {
              this.info1.passengerSeats = data;
              this.http.get('http://localhost:64697/api/SeatPrice/' + this.seatSer.tripId1).subscribe(data => {
                this.info1.SeatPrice = data;
                this.rows1 = new Array(Math.ceil(this.info1.airplaneInfo.Capacity / this.info1.airplaneInfo.Column_no));
                this.columns1 = new Array(this.info1.airplaneInfo.Column_no);

                for(let i = 0; i < this.rows.length; i++){
                  this.rows1[i] = i + 1;
                }

                for(let j = 0; j< this.columns1.length; j++){ 
                  this.columns1[j] = String.fromCharCode(65 + j);
                }

                // this.rows = [1]
                // this.columns = ['A', 'B', 'C', 'D', 'E', 'F']
                
                // for(var seat of this.info.passengerSeats){
                //   for(let idx = 0; idx < this.info.Seats.length; idx++){
                //     if(this.info.Seats[idx].SeatID === seat){
                //       this.info.Seats[idx].disabled = true
                //       break;
                //     }
                //   }
                // }
                //{ "airplaneInfo": [ { "Airplane_no": "6E453", "Capacity": 60, "Column_no": 6 } ], 
                //"Seats": [ { "SeatID": "1A", "SeatType": "B" } ], "passengerSeats": [ "1A", "2A" ] }
                for(let i = 0; i < this.info1.Seats.length; i++){
                  this.seatObject1[this.info1.Seats[i].SeatID] = {
                    type : this.info1.Seats[i].SeatType,
                    price : this.info1.SeatPrice[this.prefixClass[this.info1.Seats[i].SeatType]]
                  }
                }

                for(var pSeat of this.info1.passengerSeats){
                  this.seatObject1[pSeat].booked = true
                }
              })
            });
          });
      });
    }
  }

  ngOnInit(): void {
  }

  handleSeatClick(s, id: string){
    if(s.clicked){
      s.clicked = false
      this.seatCount -= 1;
    }
    else{
      if(this.seatCount == this.count){
        alert("Max Seat Selected")
        return
      }
      s.clicked = true
    }


    if(this.selectedSeats[id]){
      delete this.selectedSeats[id]
    }
    else{
      this.selectedSeats[id] = Number(s.price)
    }

    this.seatCount = Object.keys(this.selectedSeats).length;


    // debugger
    // this.selectedSeats[id] =  Number(s.price)

    var x  = 0;
    this.overallFare -= this.totalFare;
    this.totalFare = 0;
    for(var item of Object.keys(this.selectedSeats)){
      x =  x + this.selectedSeats[item];
    }

    this.totalFare = x;
    this.overallFare += x;
  }

  handleSeatClick1(s, id: string){
    if(s.clicked){
      s.clicked = false
      this.seatCount1 -= 1;
    }
    else{
      if(this.seatCount1 == this.count1){
        alert("Max Seat Selected")
        return
      }
      s.clicked = true
    }


    if(this.selectedSeats1[id]){
      delete this.selectedSeats1[id]
    }
    else{
      this.selectedSeats1[id] = Number(s.price)
    }

    this.seatCount1 = Object.keys(this.selectedSeats1).length;


    // debugger
    // this.selectedSeats[id] =  Number(s.price)

    var x  = 0;
    this.overallFare -= this.totalFare1
    this.totalFare1 = 0;
    for(var item of Object.keys(this.selectedSeats1)){
      x =  x + this.selectedSeats1[item];
    }

    this.totalFare1 = x;
    this.overallFare += x;
  }

  onClick(){
    this.router.navigate(['/search'])
  }

  
}
