import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';

@Component({
  selector: 'app-courses',
  templateUrl: './courses.component.html',
  styleUrls: ['./courses.component.scss']
})
export class CoursesComponent implements OnInit {

  title: string = 'Health OQ Courses';
  url: string = 'home/academy';
  subtitle: string = 'Academy';
  parent: string = 'Courses';
  sidebar: SideBarListModel;

  constructor() { }

  ngOnInit() {
  }

}
