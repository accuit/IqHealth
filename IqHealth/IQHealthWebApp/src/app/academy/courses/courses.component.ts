import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { APIResponse } from 'src/app/core/app.models';
import { AcademyService } from '../academy.service';
import { ActivatedRoute } from '@angular/router';
import { CourseMaster } from '../academy.model';

@Component({
  selector: 'app-courses',
  templateUrl: './courses.component.html',
  styleUrls: ['./courses.component.scss']
})
export class CoursesComponent implements OnInit {

  title: string = 'Health IQ Courses';
  url: string = 'home/academy';
  subtitle: string = 'Courses';
  parent: string = 'Academy';
  sidebar: SideBarListModel;

  courses: CourseMaster[] = [];
  courseDetails: CourseMaster;
  activeID: any;
  isLoaded: boolean = false;

  constructor(private route: ActivatedRoute, private readonly service: AcademyService) {
    this.route.paramMap.subscribe(params => {
      this.activeID = params.get("id");
    });
  }

  ngOnInit() {

    this.service.getMasterCourses()
      .subscribe((data: APIResponse) => {
        this.courses = data.singleResult;
        this.loadCoursesPage();
      })

  }

  loadCoursesPage(): any {
    this.sidebar = {
      page: 'Academy Courses',
      list: this.courses,
      alignment: 'right',
      activeID: this.activeID
    }

      this.courseDetails = this.getCourseDetails();
      this.title = this.courseDetails.name;
      this.subtitle = this.title;
    
  }

  displayCourse(event) {
    if (this.isLoaded) {
      this.getCourseDetails(event);
      this.title = this.courseDetails.name;
      this.subtitle = this.title;
    }
  }

  getCourseDetails(id?): any {
    id = !id ? 1 : id;
    return this.service.getCourseDetails(id)
      .subscribe((data: APIResponse) => {
        this.courseDetails = data.singleResult;
        this.isLoaded = true;
      });
  }

}
