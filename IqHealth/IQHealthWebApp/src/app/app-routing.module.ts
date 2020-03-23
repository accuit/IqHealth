import { NgModule } from '@angular/core';
import { Routes, RouterModule, Route } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { BookAppointmentComponent } from './book-appointment/book-appointment.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { AboutUsComponent } from './about-us/about-us.component';
import { ServicesListComponent } from './services/services-list/services-list.component';
import { DoctorsListComponent } from './doctors/doctors-list/doctors-list.component';
import { ServiceDetailsComponent } from './services/service-details/service-details.component';
import { PackageCategoryDetailsComponent } from './packages/package-category-details/package-category-details.component';
import { PackageCategoryListComponent } from './packages/package-category-list/package-category-list.component';
import { PackageDetailsComponent } from './packages/package-details/package-details.component';
import { AcademyComponent } from './academy/academy.component';
import { CoursesComponent } from './academy/courses/courses.component';
import { FeeStructureComponent } from './academy/fee-structure/fee-structure.component';
import { EnquiryComponent } from './enquiry/enquiry.component';
import { LoginComponent } from './academy/account/login/login.component';
import { RegisterComponent } from './academy/account/register/register.component';
import { ResetPasswordComponent } from './academy/account/reset-password/reset-password.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { AuthGuard } from './authenication/auth.guard';
import { BookATestComponent } from './book-a-test/book-a-test.component';
import { PagenotfoundComponent } from './pagenotfound/pagenotfound.component';
import { CareerComponent } from './career/career.component';
import { PartnerWithUsComponent } from './partner-with-us/partner-with-us.component';
import { HealthcareUnitComponent } from './partner-with-us/healthcare-unit/healthcare-unit.component';
import { CorporateTieUpComponent } from './partner-with-us/corporate-tie-up/corporate-tie-up.component';
import { OrganizeCampComponent } from './partner-with-us/organize-camp/organize-camp.component';

const routes: Route[] = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'home',
    component: HomeComponent
  },
  {
    path: 'services-list',
    component: ServicesListComponent
  },
  {
    path: 'service-details/:id',
    component: ServiceDetailsComponent
  },
  {
    path: 'package-categories-list',
    component: PackageCategoryListComponent
  },
  {
    path: 'package-category-details/:id',
    component: PackageCategoryDetailsComponent
  },
  {
    path: 'package-details/:id',
    component: PackageDetailsComponent
  },
  {
    path: 'our-doctors',
    component: DoctorsListComponent
  },
  {
    path: 'book-an-appointment',
    component: BookAppointmentComponent
  },
  {
    path: 'contact-us',
    component: ContactUsComponent
  },
  {
    path: 'know-about-us',
    component: AboutUsComponent
  },
  {
    path: 'academy',
    component: AcademyComponent
  },
  {
    path: 'academy/our-courses',
    component: CoursesComponent
  },
  {
    path: 'partner-with-us',
    component: PartnerWithUsComponent
  },
  {
    path: 'partner-with-us/healthcare-unit',
    component: HealthcareUnitComponent
  },
  {
    path: 'partner-with-us/corporate-tie-up',
    component: CorporateTieUpComponent
  },
  {
    path: 'partner-with-us/organize-free-camp',
    component: OrganizeCampComponent
  },
  {
    path: 'book-a-test',
    component: BookATestComponent
  },
  {
    path: 'academy/fee-structure',
    component: FeeStructureComponent
  },
  {
    path: 'online-enquiry/:id',
    component: EnquiryComponent
  },
  {
    path: 'user-login',
    component: LoginComponent
  },
  {
    path: 'register',
    component: RegisterComponent
  },
  {
    path: 'reset-password',
    component: ResetPasswordComponent
  },
  {
    path: 'career',
    component: CareerComponent
  },
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthGuard],
  },
  {
    path: '**',
    component: PagenotfoundComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
