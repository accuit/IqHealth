import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { BookAppointmentComponent } from './book-appointment/book-appointment.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { AboutUsComponent } from './about-us/about-us.component';
import { ServicesListComponent } from './services/services-list/services-list.component';
import { DepartmentListComponent } from './departments/department-list/department-list.component';
import { DoctorsListComponent } from './doctors/doctors-list/doctors-list.component';
import { ServiceDetailsComponent } from './services/service-details/service-details.component';
import { DepartmentDetailsComponent } from './departments/department-details/department-details.component';


const routes: Routes = [
  {
    path: '',
    redirectTo:'home',
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
    path: 'departments-list',
    component: DepartmentListComponent
  },
  {
    path: 'departments/:id',
    component: DepartmentDetailsComponent
  },
  {
    path: 'doctors-list',
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
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
