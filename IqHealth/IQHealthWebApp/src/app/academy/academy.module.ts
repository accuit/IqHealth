import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FeeStructureComponent } from './fee-structure/fee-structure.component';
import { CoursesComponent } from './courses/courses.component';
import { AcademyComponent } from './academy.component';
import { AcademyService } from './academy.service';
import { SharedModule } from '../shared/shared.module';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [
    AcademyComponent,
    CoursesComponent,
    FeeStructureComponent
  ],
  imports: [
    RouterModule,
    CommonModule,
    SharedModule
  ],
  providers:[
    AcademyService
  ]
})
export class AcademyModule { }
