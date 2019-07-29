import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AboutComponent } from './about/about.component';
import { PackageComponent } from './package/package.component';
import { LoginComponent } from './account/login/login.component';
import { ServicesComponent } from './services/services.component';
import { HomeComponent } from './home/home.component';
import {
  ReactiveFormsModule,
  FormsModule,
  FormGroup,
  FormControl,
  Validators,
  FormBuilder
} from '@angular/forms';
import { ConsultationComponent } from './consultation/consultation.component';
import { AcademyComponent } from './academy/academy.component';
import { BookTestComponent } from './book-test/book-test.component';
import { ArticlesEventComponent } from './articles-event/articles-event.component';
import { HealthPackagesComponent } from './health-packages/health-packages.component';
import { ContactComponent } from './contact/contact.component';
import { DoctorConsultationComponent } from './doctor-consultation/doctor-consultation.component';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';

@NgModule({
  declarations: [
    AppComponent,
    AboutComponent,
    PackageComponent,
    LoginComponent,
    ServicesComponent,
    HomeComponent,
    ConsultationComponent,
    AcademyComponent,
    BookTestComponent,
    ArticlesEventComponent,
    HealthPackagesComponent,
    ContactComponent,
    DoctorConsultationComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    FormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent
  ]
})
export class AppModule { }
