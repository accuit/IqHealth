import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { PackageCategory, PackageMaster, APIResponse } from 'src/app/core/app.models';
import { AppService } from 'src/app/core/app.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-package-category-details',
  templateUrl: './package-category-details.component.html',
  styleUrls: ['./package-category-details.component.scss']
})
export class PackageCategoryDetailsComponent implements OnInit {

  title: string = 'All Packages';
  url: string = '#';
  subtitle: string = 'Packages List';
  parent: string = 'Home';
  sidebar: SideBarListModel;
  categories: PackageCategory[] = [];
  category: PackageCategory;
  packages: PackageMaster[] = [];
  packageDetails: any;
  activeID: any;
  isloaded: boolean = false;
  isloading = true;
  live = false;

  constructor(private route: ActivatedRoute,
    private readonly service: AppService) {
    this.route.paramMap.subscribe(params => {
      this.activeID = params.get("id");
    });
  }

  ngOnInit() {
    this.service.getAllPackageCategories()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.categories = data.SingleResult;
        this.loadCategoryPage();
      })

  }

  loadCategoryPage(): any {
    this.sidebar = {
      page: 'All Packages',
      list: this.categories,
      alignment: 'left',
      activeID: this.activeID
    }

    this.category = this.categories.filter(x => x.ID == Number(this.activeID))[0];
    console.log(this.category);
    this.packages = this.service.getPackagesByCategory(this.category.ID)
      .subscribe((data: APIResponse) => {
        this.isloading = false;
        this.isloaded = true;
        console.log(this.packages);
        this.packages = data.SingleResult;
      })

    this.title = this.category.Name;
    this.subtitle = this.title;

  }

  displayPackages(event) {

    this.category = this.categories.filter(x => x.ID == Number(event))[0];
    this.title = this.category.Name;
    this.subtitle = this.title;

    if (this.isloaded)
      this.isloading = true;
    this.service.getPackagesByCategory(event)
      .subscribe((data: APIResponse) => {
        this.isloading = false;
        console.log(this.packages);
        this.isloaded = true;
        this.packages = data.SingleResult;
      })

  }

}
