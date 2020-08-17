import { Component, OnInit } from '@angular/core';
import { SeatSelectServices } from '../Services/SeatsSelectService';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {
  info: any;

  constructor(public seatSer: SeatSelectServices) {
  }

  ngOnInit(): void {
  }

  saveDetails(){
    this.seatSer.saveDetail('6e454', 'TR10', 5);
    this.seatSer.saveDetailForRoundTrip('6e454', 'TR10', 5, '6e456', 'TR11');
  }
}
