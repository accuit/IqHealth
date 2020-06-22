import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StudentProfileComponent } from './student-profile/student-profile.component';
import { CourseListComponent } from './course-list/course-list.component';
import { BooksListComponent } from './books-list/books-list.component';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../core/auth/auth-guard';
import { StudentService } from './student.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NouisliderModule } from 'ng2-nouislider';
import { TagInputModule } from 'ngx-chips';
import { MaterialModule } from '../app.module';
import { SharedModule } from '../shared/shared.module';
import { PrintModule } from '../print/print.module';

export const StudentRoutes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    children: [
      {
        path: 'profile',
        component: StudentProfileComponent
      },
      {
        path: 'courses',
        component: CourseListComponent
      },
      {
        path: 'books',
        component: BooksListComponent
      }
    ]
  }
];

@NgModule({
  declarations: [StudentProfileComponent, CourseListComponent, BooksListComponent],
  imports: [
    CommonModule,
    RouterModule.forChild(StudentRoutes),
    FormsModule,
    ReactiveFormsModule,
    NouisliderModule,
    TagInputModule,
    MaterialModule,
    SharedModule,
    PrintModule
  ],
  providers: [StudentService]
})
export class StudentModule { }
