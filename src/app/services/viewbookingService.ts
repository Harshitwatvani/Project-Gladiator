import { Booking } from "../models/booking"
import {HttpClient} from '@angular/common/http';
import { Injectable } from "@angular/core";

@Injectable()
export class ViewbookingService{

    bookings:Booking[];
    constructor(private http:HttpClient){
        this.bookings = [];
    }

    public getBookings(id:string){
        id = "U1";
        return this.http.get("http://localhost:57445/api/ViewBooking/"+id);
    }
}