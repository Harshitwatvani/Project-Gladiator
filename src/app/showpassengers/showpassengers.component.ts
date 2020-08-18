import { Component, OnInit } from '@angular/core';
import {PassengerService} from '../services/passengerService';
import {Passenger} from '../models/passenger';
@Component({
  selector: 'app-showpassengers',
  templateUrl: './showpassengers.component.html',
  styleUrls: ['./showpassengers.component.css']
})
export class ShowpassengersComponent implements OnInit {

  passengers;
  id;
  constructor(private passengerService:PassengerService) {
  
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
