import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from '../core/sidebar-list.model';

@Component({
  selector: 'app-academy',
  templateUrl: './academy.component.html',
  styleUrls: ['./academy.component.scss']
})
export class AcademyComponent implements OnInit {

  title: string = 'Health IQ Academy';
  url: string = '#';
  subtitle: string = 'Academy';
  parent: string = 'Home';
  sidebar: SideBarListModel;
  
  constructor() { }

  ngOnInit() {
  }

}
