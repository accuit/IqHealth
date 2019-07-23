import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ServicesComponent } from './services/services.component';
import { AboutComponent } from './about/about.component';
import { HomeComponent } from './home/home.component';
import { ConsultationComponent } from './consultation/consultation.component';
import { BookTestComponent } from './book-test/book-test.component';
import { AcademyComponent } from './academy/academy.component';
import { ArticlesEventComponent } from './articles-event/articles-event.component';


const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'services',
    component: ServicesComponent
  },
  {
    path: 'about-us',
    component: AboutComponent
  },
  {
    path: 'doctor-consultation',
    component: ConsultationComponent
  },
  {
    path: 'academy',
    component: AcademyComponent
  },
  {
    path: 'book-a-test',
    component: BookTestComponent
  },
  {
    path: 'articles-and-event',
    component: ArticlesEventComponent
  },


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
