import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { SubCourses } from '../academy.model';
import { AcademyService } from '../academy.service';
import { APIResponse } from 'src/app/core/app.models';

@Component({
  selector: 'app-fee-structure',
  templateUrl: './fee-structure.component.html',
  styleUrls: ['./fee-structure.component.scss']
})
export class FeeStructureComponent implements OnInit {

  title: string = 'Fee Structure';
  url: string = 'home/academy';
  subtitle: string = 'Academy';
  parent: string = 'Fee Structure';
  sidebar: SideBarListModel;
  isLoaded = false;
  subCourses: SubCourses[] = [];

  constructor(private readonly service: AcademyService) {
  }

  ngOnInit() {

    this.service.getSubCourses()
      .subscribe((data: APIResponse) => {
        this.subCourses = data.singleResult;
        this.isLoaded = true;
      })

  }

}
