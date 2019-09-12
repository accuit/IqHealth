import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/core/app.service';
import { APIResponse, Speciality, Doctor } from 'src/app/core/app.models';

@Component({
  selector: 'app-find-doctor',
  templateUrl: './find-doctor.component.html',
  styleUrls: ['./find-doctor.component.scss']
})
export class FindDoctorComponent implements OnInit {

  isLoaded: boolean = false;
  specialities: Speciality[] = [];
  doctors: Doctor[] = [];
  selectedID: any;
  selectedText= 'Select Doctors';
  selectedSpeciality = 'Select Speciality';

  constructor(private readonly service: AppService) { 
    this.loadSpecialities();
    this.loadDoctorsList();
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

  selectDoctor(doctor) {
    this.selectedID = doctor.ID;
    this.selectedText = doctor.FirstName + ' ' + doctor.LastName;
    // this.appointmentForm.controls['doctorID'].setValue( doctor.ID); 
  }

  selectSpeciality(speciality: Speciality) {
    this.selectedID = speciality.ID;
    this.selectedText = speciality.Speciality;
    // this.appointmentForm.controls['doctorID'].setValue( doctor.ID); 
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.doctors = data.SingleResult;
      })
  }

}
