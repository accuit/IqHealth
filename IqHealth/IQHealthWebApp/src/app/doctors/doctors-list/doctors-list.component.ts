import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { Doctor, APIResponse } from 'src/app/core/app.models';
import { AppService } from 'src/app/core/app.service';

@Component({
  selector: 'app-doctors-list',
  templateUrl: './doctors-list.component.html',
  styleUrls: ['./doctors-list.component.scss']
})
export class DoctorsListComponent implements OnInit {

  title: string = 'Our Doctors List';
  url: string = '#';
  subtitle: string = 'Find Doctors';
  parent: string = 'Home';
  sidebar: SideBarListModel;
  doctors: Doctor[] = [];
  isloaded: boolean = false;


  constructor(private readonly service: AppService) { }

  ngOnInit() {
    this.loadDoctorsList();
  }

  loadDoctorsListBySpeciality(id: number, el: HTMLDivElement): any {
    console.log('calling getDoctorsBySpeciality');
    this.service.getDoctorsBySpeciality(id)
      .subscribe((data: APIResponse) => {
        this.doctors = data.SingleResult;
      })
    el.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        console.log(data);
        this.doctors = data.SingleResult;
      })
  }

}
