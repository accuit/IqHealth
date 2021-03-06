import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { ServicesModel, APIResponse } from 'src/app/core/app.models';
import { AppService } from 'src/app/core/app.service';


@Component({
  selector: 'app-service-details',
  templateUrl: './service-details.component.html',
  styleUrls: ['./service-details.component.scss']
})
export class ServiceDetailsComponent implements OnInit {
  title: string = 'title';
  url: string = '#';
  subtitle: string = 'Subtitle';
  parent: string = 'Parent';
  sidebar: SideBarListModel;
  services: ServicesModel[] = [];
  servicedetails: any;
  activeID: any;
  isLoaded: boolean = false;

  constructor(private route: ActivatedRoute,
    private readonly service: AppService) {
    this.route.paramMap.subscribe(params => {
      this.activeID = params.get("id");
    });
  }

  ngOnInit() {

    this.service.getAllServices()
      .subscribe((data: APIResponse) => {
        this.services = data.singleResult;
        this.isLoaded = true;
        this.loadServicePage();
      })

  }

  loadServicePage(): any {
    this.sidebar = {
      page: 'All Services',
      list: this.services,
      alignment: 'left',
      activeID: this.activeID
    }

    if (this.isLoaded) {
      this.servicedetails = this.services.filter(x=>x.id == Number(this.activeID))[0];
      this.title = this.servicedetails.name;
      this.subtitle = this.title;
    }

  }

  displayService(event) {
    if (this.isLoaded){
      this.servicedetails = this.services.filter(x=>x.id == Number(event))[0];
      this.title = this.servicedetails.name;
      this.subtitle = this.title;
    }
  }

}
