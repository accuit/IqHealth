import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
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

const routes: Routes = [
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
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthGuard],
  },
  {
    path: '**',
    component: HomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {useHash: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
