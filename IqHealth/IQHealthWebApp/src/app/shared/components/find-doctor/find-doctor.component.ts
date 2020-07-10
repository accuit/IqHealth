import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/core/app.service';
import { APIResponse, Speciality, Doctor } from 'src/app/core/app.models';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-find-doctor',
  templateUrl: './find-doctor.component.html',
  styleUrls: ['./find-doctor.component.scss']
})
export class FindDoctorComponent implements OnInit {

  findDocForm: FormGroup;
  isLoaded: boolean = false;
  specialities: Speciality[] = [];
  doctors: Doctor[] = [];
  selectedDocID: any;
  selectedDoctor = 'Select Doctors';
  selectedSpeciality = 'Select Speciality';
  selectedSpecID: any;

  constructor(
    private formBuilder: FormBuilder, private readonly service: AppService, private router: Router) {

    this.loadSpecialities();
    this.loadDoctorsList();
  }

  ngOnInit() {
    this.findDocForm = this.loadForm();
  }

  loadSpecialities(): any {
    this.service.getSpecialities()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.specialities = data.singleResult;
      })
  }


  selectDoctor(doctor) {
    this.selectedDocID = doctor.id;
    this.selectedDoctor = doctor.firstName + ' ' + doctor.lastName;
    this.findDocForm.controls['doctorID'].setValue( doctor.id); 
  }

  selectSpeciality(speciality: Speciality) {
    this.selectedSpecID = speciality.id;
    this.selectedSpeciality = speciality.speciality;
    this.findDocForm.controls['specialityID'].setValue( speciality.id); 
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.doctors = data.singleResult;
      })
  }

  onSubmit(): any {
    const params = this.findDocForm.value;
    console.log(params);
     this.router.navigate(['our-doctors'], { queryParams: { doctor: params.doctorID, speciality: params.specialityID } });

  }

  loadForm(): any {
    return this.formBuilder.group({
      specialityID: [''],
      doctorID: ['']
    });

  }

}
