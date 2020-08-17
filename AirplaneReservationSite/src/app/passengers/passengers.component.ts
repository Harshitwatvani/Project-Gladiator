import { Component, OnInit } from '@angular/core';
import { Passenger } from '../models/Passenger';
import { PassengerService } from '../services/PassengerService';

@Component({
  selector: 'app-passengers',
  templateUrl: './passengers.component.html',
  styleUrls: ['./passengers.component.css']
})
export class PassengersComponent implements OnInit {

  passenger:Passenger;
  passengers;
  id;
  name;
  gender;
  n:boolean=false;
  a:boolean=false;
  g:boolean=false;
  s:boolean=true;
  age:number;
  seats:string[];
  seat:string;
  result;
  constructor(private passengerService:PassengerService) { 
    this.name=new String();
   // this.age=0;
    this.gender=new String();
  //   console.log(this.passenger);
  //   this.passengerService.getPassengers(this.id).subscribe((data)=>{
  //     this.passengers= data;
  //  } 
  //  )
    this.passenger = new Passenger();
    this.seats=["1A","2B"];
    this.seats.reverse();
    this.seat=this.seats.pop();
   //this.seats.pop();
   // this.seat=this.seats.pop();
    
          console.log(this.seats.length)
    
    //this.seat=this.seats[0];
    
  }
  insertPassenger(){
    
    if(this.name==""||this.age==undefined||this.gender=="")
    {
      
        if(this.name=="")
        this.n=true;
        else
        this.n=false;
        if(this.age==undefined)
        this.a=true;
        else
        this.a=false;
        if(this.gender=="")
        this.g=true;
        else
        this.g=false;

    }
   else
   {
     this.g=false;
     this.n=false;
     this.a=false;
    this.passenger.SeatID=this.seat;
    this.passenger.PName=this.name;
    this.passenger.Age=this.age;
    this.passenger.Gender=this.gender;
    console.log(this.passenger);
  //   this.passengerService.postPassengers(this.passenger).subscribe((data)=>{
  //     this.result = data;
  //     console.log(data);
  //   })
     this.passenger=new Passenger();
    this.seat=this.seats.pop();
    this.name="";
    this.age=undefined;
    this.gender="";
    console.log(this.seat);
    if(this.seat==undefined)
    {
      this.s=false;
    }
    }

  }
  exist(passenger){
    this.name=passenger.Pname;
this.gender=passenger.Gender;
this.age=passenger.Age;
    //this.passenger=passenger;
    console.log(this.name);

  }
  fetchPassengers()
  {
    this.passengerService.getPassengers(this.id).subscribe((data)=>{
      this.passengers= data;
   } 
   )
  }

  ngOnInit(): void {
  }

}
