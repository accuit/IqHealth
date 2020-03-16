import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DefaultHeaderComponent } from './shared/components/default-header/default-header.component';
import { FooterComponent } from './footer/footer.component';
import { HomeComponent } from './home/home.component';
import { TopHeaderComponent } from './shared/components/top-header/top-header.component';
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
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { PackageCategoryListComponent } from './packages/package-category-list/package-category-list.component';
import { PackageDetailsComponent } from './packages/package-details/package-details.component';
import { PackageCategoryDetailsComponent } from './packages/package-category-details/package-category-details.component';
import { PackagesListComponent } from './packages/packages-list/packages-list.component';
import { AcademyModule } from './academy/academy.module';
import { EnquiryComponent } from './enquiry/enquiry.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AppJsonService } from './core/app.json.service';
import { AccountModule } from './academy/account/account.module';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { PagesModule } from './pages/pages.module';
import { AuthGuard } from './authenication/auth.guard';
import { AuthInterceptor } from './authenication/auth.interceptor';
import { BookATestComponent } from './book-a-test/book-a-test.component';
import { PagenotfoundComponent } from './pagenotfound/pagenotfound.component';
import { CareerComponent } from './career/career.component';

@NgModule({
  declarations: [
    AppComponent,
    FooterComponent,
    HomeComponent,
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
    AboutUsComponent,
    EnquiryComponent,
    BookATestComponent,
    PagenotfoundComponent,
    CareerComponent
  ],
  imports: [
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    BrowserModule,
    AppRoutingModule,
    SharedModule,
    AcademyModule,
    AccountModule,
    PagesModule
  ],
  providers: [
    { provide: 'LOCALSTORAGE', useFactory: getLocalStorage },
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
    AuthGuard,
    AppService,
    AppJsonService
  ],
  exports:[

  ],
  entryComponents: [HomeComponent],
  bootstrap: [AppComponent]
})
export class AppModule { }

export function getLocalStorage() {
  return (typeof window !== "undefined") ? window.localStorage : null;
}
