import { Passenger } from "../models/Passenger"
import {HttpClient} from '@angular/common/http';
import { Injectable } from "@angular/core";

@Injectable()
export class PassengerService{

    passengers:Passenger[];
    constructor(private http:HttpClient){
        this.passengers = [];
    }

    public getPassengers(id:string){
        id = "U1";
        return this.http.get("http://localhost:57445/api/Passenger/"+id);
    }
    public postPassengers(passenger:Passenger){
       // passenger.SeatID="3B";
        passenger.TicketID="T1";
        return this.http.post("http://localhost:57445/api/Passenger",passenger);
    }
}