import { Component, OnInit } from '@angular/core';
import { SubCourses } from '../academy/academy.model';
import { AcademyService } from '../academy/academy.service';
import { APIResponse } from '../core/app.models';

@Component({
  selector: 'app-enquiry',
  templateUrl: './enquiry.component.html',
  styleUrls: ['./enquiry.component.scss']
})
export class EnquiryComponent implements OnInit {

  title: string = 'Student Enquiry Form';
  url: string = '#';
  subtitle: string = 'Find Doctors';
  parent: string = 'Home';
  isLoaded = false;

  subCourses: SubCourses[] = [];
  selectedID: any;
  selectedText = 'Select Course';

  constructor(private readonly service: AcademyService) {
  }

  ngOnInit() {
    this.service.getSubCourses()
      .subscribe((data: APIResponse) => {
        this.subCourses = data.SingleResult;
        this.isLoaded = true;
      })
  }


  selectCourse(course: SubCourses) {
    this.selectedID = course.ID;
    this.selectedText = course.Name;
  }

}
