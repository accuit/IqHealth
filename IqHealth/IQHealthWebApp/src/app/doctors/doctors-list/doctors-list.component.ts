import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';
import { Doctor, APIResponse, Speciality } from 'src/app/core/app.models';
import { AppService } from 'src/app/core/app.service';
import { ActivatedRoute, Params } from '@angular/router';
import { filter } from 'rxjs/operators';
import { Observable } from 'rxjs';

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
  isLoaded: boolean = false;
  specialities: Speciality[] = [];
  showSlider = false;
  urlParams: any;

  constructor(private readonly service: AppService, private readonly route: ActivatedRoute) {

    this.loadSpecialities();
    this.loadDoctorsList();
  }

  ngOnInit() {

  }

  executeParams(): void {
    this.route.queryParams
      .subscribe(params => {
        this.urlParams = params;
        if (params.doctor || params.speciality) {
          this.showSlider = false;
          if (params.doctor)
            this.doctors = this.doctors.filter(x => x.id === Number(params.doctor));
          if (params.speciality)
            this.doctors = this.doctors.filter(x => x.specialityID === Number(params.speciality));
        }
        else{
          this.showSlider = true;
        }

      });
  }

  loadSpecialities(): any {
    this.service.getSpecialities()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.specialities = data.singleResult;
      })
  }

  loadDoctorsListBySpeciality(id: number, el: HTMLDivElement): any {
    this.service.getDoctorsBySpeciality(id)
      .subscribe((data: APIResponse) => {
        this.doctors = data.singleResult;
      })
    el.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
  }

  getDoctors(id) {
    this.doctors = this.doctors.filter(x => x.specialityID === Number(id));
  }

  resetDoctorsList(){
    this.route.queryParams = new Observable<Params>();
    this.loadDoctorsList();
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.doctors = data.singleResult;
        console.log(this.doctors);
        this.executeParams();
      })
  }

}
