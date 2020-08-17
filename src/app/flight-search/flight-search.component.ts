import { Component, OnInit } from '@angular/core';
import { FormGroup,FormControl,Validators } from '@angular/forms';
import {AirportSearchService} from '../services/airport.Search';
import {Airports,FlightDetail,BookingPost,Tickets,Booking} from '../models/airport'; 
import { Observable, Subject } from 'rxjs';  
import { DatePipe } from '@angular/common';
@Component({
  selector: 'app-flight-search',
  templateUrl: './flight-search.component.html',
  styleUrls: ['./flight-search.component.css']
})
export class FlightSearchComponent implements OnInit {

 
  airportName;
  flight:FlightDetail;
  flight1:FlightDetail;
  booked:BookingPost;
  bks:BookingPost[];
  ticket:Tickets;
  flag:boolean;
  spanFlagFrom:boolean
  spanFlagTo:boolean
  resultFlag:boolean;
  airportFrom;
  airportTo;
  oneWayFlag:boolean;
  returnFlag:boolean;
  tripType:number;
  
  result;
  result1;
  result2;
  result3
  resultBook;
  resultTicket;
  userid;
  abcd;
  selectedLink:string;
  bookinfo;
  myForm:FormGroup;
  trip_Round : Booking;
  tripid_1;
  tripid_2;
  
  datePipe:DatePipe;
  constructor(private service:AirportSearchService) { 
     

    this.flag=true;
    this.spanFlagFrom=true;
	this.spanFlagTo=true;
	this.tripType=1;
	this.resultFlag=false;
	this.oneWayFlag=false;
	this.flight=new FlightDetail();
	this.flight1=new FlightDetail();
	this.booked=new BookingPost();
	this.ticket=new Tickets();
	this.trip_Round = new Booking();
	this.resultBook=[];
	this.userid='U1';
	this.bks=[];
	this.returnFlag=false;
	this.selectedLink='oneWay';
	
	 this.myForm=new FormGroup({
      deptCityName:new FormControl(null,Validators.required),
      arrivalCityName:new FormControl(null,Validators.required),
      deptdate:new FormControl(null,Validators.required),
	  returndate:new FormControl({value: '', disabled: true},Validators.required),
	  Passenger:new FormControl(null,[Validators.required,Validators.min(1)])

    })
  }
  
    public get deptCityName()
  {
     return this.myForm.get('deptCityName');
	
  }
    public get arrivalCityName()
  {
     return this.myForm.get('arrivalCityName');
  }
   public get deptdate()
  {
    return this.myForm.get('deptdate');
  }
   public get returndate()
  {
    return this.myForm.get('returndate');
  }
   public get Passenger()
  {
    return this.myForm.get('Passenger');
  }
  
  trip(e:string):void
  {
	  this.flight.tripType='';
	  this.selectedLink=e;
	  console.log(this.selectedLink);
	  this.resultFlag=false;
	 this.oneWayFlag=false;
	  if(this.selectedLink==='oneWay')
	  {
		  this.myForm.get('returndate').disable();
		   this.returnFlag=false;
	  }
	  else
		  if(this.selectedLink==='twoWay')
		  {
			  this.myForm.get('returndate').enable();
			  
		  }
  }
  

  search(term:string,name):void
  {
     this.flag=true;
      
	 if(term=='')
	 {
		 this.airportFrom=[];
		 this.airportTo=[];
	 }
	 
	 else{
		 this.service.getAirports(term).subscribe(data=>{
      
			if(name=='From')
			{
				this.airportFrom=[data][0];
				this.spanFlagFrom=true;
			}else
			{
				this.airportTo=[data][0]; 
				this.spanFlagTo=true;
			}
		})
	 }
	
  
  }

  onSelectAirport(obj,name)
  {
    if((obj.airport_name || obj.city_name)!= '')
    {
	  if(name=='From')
	  {
		  console.log(obj.city_name);
		  this.deptCityName.setValue(obj.city_name);
		  this.spanFlagFrom=false;
	  }
	  else
	  {
		  this.arrivalCityName.setValue(obj.city_name);
		  this.spanFlagTo=false;
	  }
		
	
      this.flag=true;
     
    }
    else{
      return false;
    }
	
    
  }
  
  show()
  {
	  if(this.myForm.valid)
    {
	  
      this.flight.deptCityName=this.deptCityName.value;
      this.flight.arrivalCityName=this.arrivalCityName.value;
      this.flight.deptdate=this.deptdate.value;
	   this.flight.returndate=this.returndate.value;
	  this.flight.Passenger=this.Passenger.value;
	  this.flight.tripType=this.selectedLink;
	  if(this.flight.tripType=="oneWay")
	  {
		  this.service.showFlights(this.flight).subscribe(data =>{
			  this.result=data;
			  if(this.result.length==0)
			  {
				  this.resultFlag=true;
				  
			  }
			  else
			  {
				  this.resultFlag=false;
			  }
			  
			   this.oneWayFlag=true;
			    this.returnFlag=false;
	  })
			
	  }
	  else
	  {
		  this.oneWayFlag=true;
		  this.returnFlag=true;
		  
		  console.log(this.arrivalCityName.value);
		this.flight1.deptCityName=this.arrivalCityName.value;
		this.flight1.arrivalCityName=this.deptCityName.value;
		this.flight1.deptdate= this.returndate.value;
		this.flight.returndate=this.deptdate.value;
		this.flight1.Passenger=this.Passenger.value;

		this.service.showFlights(this.flight).subscribe(data =>{
		  
			
			  this.result=data;
			  if(this.result.length==0)
			  {
				  this.resultFlag=true;
				  
			  }
			  else
			  {
				  this.resultFlag=false;
			  }
	  })
		  
		  this.service.showFlights(this.flight1).subscribe(data =>{
		  
			console.log(data);
			  this.result2=data;
			  console.log(this.result2);
			  if(this.result2.length==0)
			  {
				  this.resultFlag=true;
				  
			  }
			  else
			  {
				  this.resultFlag=false;
			  }
			  
	  })
	  }
	  this.oneWayFlag=true;
	}
	else
	{
		alert("Enter the details in all the fields");
		this.oneWayFlag=false;
	}
	
	  
	  
  }
  
  isSelected(value:string):boolean
  {
	   if (!this.flight.tripType) 
		{ 
			return false;  
		}
	   else
		{
		  return(this.flight.tripType===value);
		}
  
  }
  
  isSelectedRound(value:string):boolean
  {
   if (!this.flight.tripType) 
   { 
            return false;  
   }
   else
  {
	  this.isSelected('oneWay');
	  return(this.flight.tripType===value);
	  
  }
  }
  

  
  choose(bookList,name)
  {
	  this.service.storeFlight(bookList,name);
	  this.bookinfo=bookList;
	  this.tripid_1=bookList.TripID;
	  console.log("info "+this.bookinfo.Airplane_no);
	  console.log("in book  "+bookList.Airplane_no+"  "+ bookList.TripID);
	  
	    
  }
  
   choose2(bookList,name)
  {
	  this.service.storeFlight(bookList,name);
	  this.bookinfo=bookList;
	  
	 this.tripid_2=bookList.TripID;
	  
	  console.log("info "+this.bookinfo.Airplane_no);
	  console.log("in book  "+bookList.Airplane_no+"  "+ bookList.TripID);
	  
	    
  }
  
  book()
  {
	  this.booked.userID='U1';
	  this.service.bookingsPost(this.booked).subscribe(data=>{
		  this.result3=data;
		  console.log(data+"booking data");
		 
	  })
	  
	  this.service.bookingsGet('U1').subscribe(data=>
	  {
		 
		  
			this.resultBook=data;
			this.bks=this.resultBook;
			this.ticket.BID=this.bks[0].BID;
			//this.ticket.TripId=bookList.TripID;
			
			this.ticket.TripId=this.tripid_1;
			
			console.log(this.ticket);
			this.service.ticketPost(this.ticket).subscribe(data =>{
			this.resultTicket=data;
			if(this.flight.tripType=='twoWay')
				{
					console.log(this.trip_Round)
					this.ticket.TripId=this.tripid_2;
					console.log("in ticket "+this.ticket.TripId);
					 this.service.ticketPost(this.ticket).subscribe(data =>{
					 this.resultTicket=data;
				
					})
				} 
		  })
	
	  })
	  

  }
  ngOnInit(): void {
  }

}

