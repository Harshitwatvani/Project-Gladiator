import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import{FormsModule,ReactiveFormsModule} from '@angular/forms';

import{DetailConfirmationService} from './services/detailConfirmationService';
import{ UserService } from './services/UserService';
import{FlightService} from './services/FlightService';
import{PassengerService} from './services/PassengerService';

import {HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DetailsConfirmationComponent } from './details-confirmation/details-confirmation.component';
import { UserRegisterationComponent } from './user-registeration/user-registeration.component';
import { DownloadTicketComponent } from './download-ticket/download-ticket.component';
import { UserLoginComponent } from './user-login/user-login.component';
import { AdminLoginComponent } from './admin-login/admin-login.component';
import { AddFlightComponent } from './add-flight/add-flight.component';
import { FlightDetailsComponent } from './flight-details/flight-details.component';
import{PassengersComponent} from './passengers/passengers.component';
import { ShowPassengersComponent } from './show-passengers/show-passengers.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { ChangePasswordComponent } from './change-password/change-password.component';

@NgModule({
  declarations: [
    AppComponent,
    DetailsConfirmationComponent,
    UserRegisterationComponent,
    DownloadTicketComponent,
    UserLoginComponent,
    AdminLoginComponent,
    AddFlightComponent,
    FlightDetailsComponent,
    PassengersComponent,
    ShowPassengersComponent,
    ForgotPasswordComponent,
    ChangePasswordComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [DetailConfirmationService,UserService,FlightService,PassengerService],
  bootstrap: [AppComponent]
})
export class AppModule { }
