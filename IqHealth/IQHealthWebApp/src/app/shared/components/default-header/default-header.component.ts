import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/core/app.service';
import { APIResponse, ServicesModel, PackageCategory } from 'src/app/core/app.models';

@Component({
  selector: 'app-default-header',
  templateUrl: './default-header.component.html',
  styleUrls: ['./default-header.component.scss']
})
export class DefaultHeaderComponent implements OnInit {

  services: ServicesModel[] = [];
  packages: PackageCategory[] = [];
  isloaded = false;
  constructor(private readonly service: AppService) { }

  ngOnInit() {
    this.loadServicesList();
    this.loadPackagesList();
  }

  loadServicesList(): any {
    this.service.getAllServices()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.services = data.singleResult;
      })
  }

  loadPackagesList(): any {
    this.service.getAllPackageCategories()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.packages = data.singleResult;
      })
  }

}
