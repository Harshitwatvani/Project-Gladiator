import { Ticket } from "../models/ticket"
import { Cancelticket } from "../models/cancelticket"
import {HttpClient} from '@angular/common/http';
import { Injectable } from "@angular/core";

@Injectable()
export class PrintticketService{

   tickets : Ticket[]
    constructor(private http:HttpClient){
        this.tickets = [];
    }

    public getTicket(id:string){
        id = "B1";
        return this.http.get("http://localhost:57445/api/PrintTicket/"+id);
    }
    public getCancelTicket(id:string){
        id = "U1";
        return this.http.get("http://localhost:57445/api/CancelTicket/"+id);
    }

    public postCancelTicket(ticket:Cancelticket){
        console.log(ticket);
        return this.http.post("http://localhost:57445/api/CancelTicket",ticket);
    }
}