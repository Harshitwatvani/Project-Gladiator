import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SeatBookComponent } from './seat-book/seat-book.component';
import { SearchComponent } from './search/search.component';
import {RouterModule, Routes} from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; 

import { HttpClientModule }  from '@angular/common/http';
import {SeatSelectServices} from './Services/SeatsSelectService';
import { AddTripComponent } from './add-trip/add-trip.component';
import { EditTripComponent } from './edit-trip/edit-trip.component';
import { RoundtripSeatBookComponent } from './roundtrip-seat-book/roundtrip-seat-book.component'


var routes: Routes = [
  {path: '', redirectTo: '/search', pathMatch: 'full' },
  {path: "search", component: SearchComponent},
  {path: "seat-booking", component: SeatBookComponent},
  {path: "roundtrip-seat-book", component: RoundtripSeatBookComponent}
]

@NgModule({
  declarations: [
    AppComponent,
    SeatBookComponent,
    SearchComponent,
    AddTripComponent,
    EditTripComponent,
    RoundtripSeatBookComponent,
  ],

  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule.forRoot(routes),
  ],

  providers: [SeatSelectServices],
  bootstrap: [AppComponent]
})
export class AppModule { }
