import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import{FormsModule} from '@angular/forms'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DetailsConfirmationComponent } from './details-confirmation/details-confirmation.component';
import { UserRegisterationComponent } from './user-registeration/user-registeration.component';

@NgModule({
  declarations: [
    AppComponent,
    DetailsConfirmationComponent,
    UserRegisterationComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
