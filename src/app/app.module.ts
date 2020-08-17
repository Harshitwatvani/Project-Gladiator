import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import{FormsModule,ReactiveFormsModule} from '@angular/forms';

import{DetailConfirmationService} from './services/detailConfirmationService';
import{ UserService } from './services/UserService';
import{FlightService} from './services/FlightService';
import{PassengerService} from './services/PassengerService';
import{AirportSearchService} from './services/airport.Search';
import{PrintticketService} from './services/printticketService';
import{ViewbookingService} from './services/viewbookingService';

import {HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DetailsConfirmationComponent } from './details-confirmation/details-confirmation.component';
import { UserRegisterationComponent } from './user-registeration/user-registeration.component';
import { UserLoginComponent } from './user-login/user-login.component';
import { AdminLoginComponent } from './admin-login/admin-login.component';
import { AddFlightComponent } from './add-flight/add-flight.component';
import { FlightDetailsComponent } from './flight-details/flight-details.component';
import{PassengersComponent} from './passengers/passengers.component';
import { ShowPassengersComponent } from './show-passengers/show-passengers.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { FlightSearchComponent } from './flight-search/flight-search.component';
import { AddTripComponent } from './add-trip/add-trip.component';
import { EditTripComponent } from './edit-trip/edit-trip.component';
import { RoundtripSeatBookComponent } from './roundtrip-seat-book/roundtrip-seat-book.component';
import { SeatBookComponent } from './seat-book/seat-book.component';
import { CancelticketComponent } from './cancelticket/cancelticket.component';
import { NavbarloginComponent } from './navbarlogin/navbarlogin.component';
import { NavbaradminComponent } from './navbaradmin/navbaradmin.component';
import { NavbarhomeComponent } from './navbarhome/navbarhome.component';
import { NavbaruserComponent } from './navbaruser/navbaruser.component';
import { PrintticketComponent } from './printticket/printticket.component';
import { ViewbookingsComponent } from './viewbookings/viewbookings.component';

@NgModule({
  declarations: [
    AppComponent,
    DetailsConfirmationComponent,
    UserRegisterationComponent,
    UserLoginComponent,
    AdminLoginComponent,
    AddFlightComponent,
    FlightDetailsComponent,
    PassengersComponent,
    ShowPassengersComponent,
    ForgotPasswordComponent,
    ChangePasswordComponent,
    FlightSearchComponent,
    AddTripComponent,
    EditTripComponent,
    RoundtripSeatBookComponent,
    SeatBookComponent,
    CancelticketComponent,
    NavbarloginComponent,
    NavbaradminComponent,
    NavbarhomeComponent,
    NavbaruserComponent,
    PrintticketComponent,
    ViewbookingsComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [DetailConfirmationService,UserService,FlightService,
    PassengerService,AirportSearchService,PrintticketService,
    ViewbookingService],
  bootstrap: [AppComponent]
})
export class AppModule { }
