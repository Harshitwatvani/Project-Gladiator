import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-details-confirmation',
  templateUrl: './details-confirmation.component.html',
  styleUrls: ['./details-confirmation.component.css']
})
export class DetailsConfirmationComponent implements OnInit {
passenger:String;
passengers:String[];
  constructor() { 
    this.passengers=[];
    this.passenger=new String();
  }

  ngOnInit(): void {
  }

}
