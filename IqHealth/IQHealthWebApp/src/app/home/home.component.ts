import { Component, OnInit } from '@angular/core';
import { AppService } from '../core/app.service';
import { APIResponse, Speciality, Doctor, ServicesModel } from '../core/app.models';
import { AppJsonService } from '../core/app.json.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  isLoaded: boolean = false;
  specialities: Speciality[] = [];
  doctors: Doctor[] = [];
  services: ServicesModel[] = [];

  constructor(private readonly service: AppService, private readonly jsonService: AppJsonService) {

  }

  ngOnInit() {
    this.loadServicesList();
  }

  loadSpecialities(): any {
    this.service.getSpecialities()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.specialities = data.SingleResult;
      })
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.doctors = data.SingleResult;
      })
  }

  loadServicesList(): any {
    this.services = this.jsonService.getAllServices();

  }

}
