import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';
// import { MatAutocompleteModule, MatInputModule } from '@angular/material';
import {AirportSearchService} from './services/airport.Search';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FlightSearchComponent } from './flight-search/flight-search.component';
import { ReactiveFormsModule} from '@angular/forms';
import { FlightSelectComponent } from './flight-select/flight-select.component';
@NgModule({
  declarations: [
    AppComponent,
    FlightSearchComponent,
    FlightSelectComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule
    // MatAutocompleteModule,
    // MatInputModule
  ],
  providers: [AirportSearchService],
  bootstrap: [AppComponent]
})
export class AppModule { }
