import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-services-list',
  templateUrl: './services-list.component.html',
  styleUrls: ['./services-list.component.scss']
})
export class ServicesListComponent implements OnInit {

  title: string = 'Our Services List';
  url:string = '#';
  subtitle: string = 'Our Services';
  parent: string = 'Home';

  constructor() { }

  ngOnInit() {
  }

}
