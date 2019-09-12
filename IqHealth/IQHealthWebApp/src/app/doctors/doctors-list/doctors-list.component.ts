import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { Doctor, APIResponse, Speciality } from 'src/app/core/app.models';
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
  specialities: Speciality[] = [];

  constructor(private readonly service: AppService) { }

  ngOnInit() {
    this.loadSpecialities();
    this.loadDoctorsList();
  }

  loadSpecialities(): any {
    this.service.getSpecialities()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.specialities = data.SingleResult;
      })
  }

  loadDoctorsListBySpeciality(id: number, el: HTMLDivElement): any {
    this.service.getDoctorsBySpeciality(id)
      .subscribe((data: APIResponse) => {
        this.doctors = data.SingleResult;
      })
    el.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
  }

  getDoctors(id){
    this.doctors = this.doctors.filter(x=>x.SpecialityID === Number(id));
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.doctors = data.SingleResult;
      })
  }

}
