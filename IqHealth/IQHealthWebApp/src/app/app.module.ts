import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DefaultHeaderComponent } from './headers/default-header/default-header.component';
import { FooterComponent } from './footer/footer.component';
import { HomeComponent } from './home/home.component';
import { TopHeaderComponent } from './headers/top-header/top-header.component';
import { SharedModule } from './shared/shared.module';
import { BookAppointmentComponent } from './book-appointment/book-appointment.component';
import { DoctorsListComponent } from './doctors/doctors-list/doctors-list.component';
import { DoctorDetailsComponent } from './doctors/doctor-details/doctor-details.component';
import { DepartmentListComponent } from './departments/department-list/department-list.component';
import { DepartmentDetailsComponent } from './departments/department-details/department-details.component';
import { ServicesListComponent } from './services/services-list/services-list.component';
import { ServiceDetailsComponent } from './services/service-details/service-details.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { AboutUsComponent } from './about-us/about-us.component';
import { AppService } from './core/app.service';
import { HttpClientModule } from '@angular/common/http';
import { PackageCategoryListComponent } from './packages/package-category-list/package-category-list.component';
import { PackageDetailsComponent } from './packages/package-details/package-details.component';
import { PackageCategoryDetailsComponent } from './packages/package-category-details/package-category-details.component';
import { PackagesListComponent } from './packages/packages-list/packages-list.component';
import { AcademyComponent } from './academy/academy.component';
import { CoursesComponent } from './academy/courses/courses.component';
import { FeeStructureComponent } from './academy/fee-structure/fee-structure.component';
import { AcademyModule } from './academy/academy.module';

@NgModule({
  declarations: [
    AppComponent,
    DefaultHeaderComponent,
    FooterComponent,
    HomeComponent,
    TopHeaderComponent,
    BookAppointmentComponent,
    DoctorsListComponent,
    DoctorDetailsComponent,
    DepartmentListComponent,
    DepartmentDetailsComponent,
    PackageCategoryListComponent,
    PackageDetailsComponent,
    PackageCategoryDetailsComponent,
    PackagesListComponent,
    ServicesListComponent,
    ServiceDetailsComponent,
    ContactUsComponent,
    AboutUsComponent
  ],
  imports: [
    HttpClientModule, 
    BrowserModule,
    AppRoutingModule,
    SharedModule,
    AcademyModule
  ],
  providers: [AppService],
  entryComponents: [HomeComponent],
  bootstrap: [AppComponent]
})
export class AppModule { }
