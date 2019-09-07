import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/core/app.service';
import { APIResponse, ServicesModel } from 'src/app/core/app.models';

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
  isloaded: boolean;
  services: ServicesModel[];

  constructor(private readonly service: AppService) { }

  ngOnInit() {
    this.loadServicesList();
  }

  loadServicesList(): any {
    this.service.getAllServices()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.services = data.SingleResult;
      })
  }

}
