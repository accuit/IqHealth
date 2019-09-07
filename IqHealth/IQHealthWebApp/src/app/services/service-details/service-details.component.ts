import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { ServicesModel } from 'src/app/core/app.models';


@Component({
  selector: 'app-service-details',
  templateUrl: './service-details.component.html',
  styleUrls: ['./service-details.component.scss']
})
export class ServiceDetailsComponent implements OnInit {
  title: string = 'Title';
  url: string = '#';
  subtitle: string = 'Subtitle';
  parent: string = 'Parent';
  sidebar: SideBarListModel;
  services: ServicesModel[] = [];

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    const service: any = {
      ID: 1,
      Name: 'Service 1',
      Description: 'Description 1',
      ImageUrl: '../../assets/Images'
    };
    this.services.push(service);

    this.sidebar = {
      page: '',
      value: this.services,
      alignment: 'left'
    }
    // this.route.paramMap.subscribe(params => {
    //   this.products.forEach((p: Product) => {
    //     if (p.id == params.id) {
    //       this.product = p;
    //     }
    //   });
    // });
  }

}
