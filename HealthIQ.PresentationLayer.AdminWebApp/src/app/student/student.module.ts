import { NgModule } from '@angular/core';
import { StudentProfileComponent } from './student-profile/student-profile.component';
import { CourseListComponent } from './course-list/course-list.component';
import { BooksListComponent } from './books-list/books-list.component';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../core/auth/auth-guard';
import { StudentService } from './student.service';
import { SharedModule } from '../shared/shared.module';
import { BaseCommonModule } from '../shared/base.common.module';

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
    BaseCommonModule,
    RouterModule.forChild(StudentRoutes),
    SharedModule
  ],
  providers: [StudentService]
})
export class StudentModule { }
