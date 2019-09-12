import { Component, OnInit } from '@angular/core';
import { AppService } from '../core/app.service';
import { APIResponse, Speciality, Doctor } from '../core/app.models';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  isLoaded: boolean = false;
  specialities: Speciality[] = [];
  doctors: Doctor[] = [];

  constructor(private readonly service: AppService) { 
  }

  ngOnInit() {
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

}
