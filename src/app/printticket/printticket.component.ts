import { Component, OnInit } from '@angular/core';
import {PrintticketService} from '../services/printticketService';


@Component({
  selector: 'app-printticket',
  templateUrl: './printticket.component.html',
  styleUrls: ['./printticket.component.css']
})
export class PrintticketComponent implements OnInit {

  tickets;
  id;
  constructor(private printticketService:PrintticketService) {
  
   }
   fetchTicket()
   {
     this.printticketService.getTicket(this.id).subscribe((data)=>{
       this.tickets= data;
     } 
     )
   }

  ngOnInit(): void {
  }

}
