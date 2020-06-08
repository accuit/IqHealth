import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StudentProfileComponent } from './student-profile/student-profile.component';
import { CourseListComponent } from './course-list/course-list.component';
import { BooksListComponent } from './books-list/books-list.component';



@NgModule({
  declarations: [StudentProfileComponent, CourseListComponent, BooksListComponent],
  imports: [
    CommonModule
  ]
})
export class StudentModule { }
