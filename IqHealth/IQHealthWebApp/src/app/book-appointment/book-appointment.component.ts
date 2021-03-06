import { Component, OnInit, AfterViewInit, AfterContentInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { AppService } from '../core/app.service';
import { Doctor, APIResponse } from '../core/app.models';
import { delay } from 'q';
import { AppJsonService } from '../core/app.json.service';


@Component({
  selector: 'app-book-appointment',
  templateUrl: './book-appointment.component.html',
  styleUrls: ['./book-appointment.component.scss']
})
export class BookAppointmentComponent implements OnInit {

  appointmentForm: FormGroup;
  submitted = false;
  status: any;
  showSpinner: boolean;
  doctorsList: Doctor[];
  isOpd = false;
  isLoaded = false;
  selectedID: any;
  selectedText = 'Select Doctors';
  message: string;
  allTimings = [];
  selectedTimeText = 'Choose Booking Time';

  constructor(
    private formBuilder: FormBuilder,
    private readonly appService: AppService,
    private readonly route: ActivatedRoute,
    private readonly jsonService: AppJsonService) {

    this.route.paramMap.subscribe(params => {
      var paramId = params.get("type");
      if (paramId == 'opd') {
        this.isOpd = true;
        this.doctorsList = []
      }
      else {

        this.getDoctors();
      }
    });

  }

  selectDoctor(doctor) {
    this.selectedID = doctor.id;
    this.selectedText = doctor.firstName;
    this.appointmentForm.controls['doctorID'].setValue(doctor.id);
  }

  selectTiming(time) {
    this.selectedTimeText = time;
    this.appointmentForm.controls['bookingTime'].setValue(time);
  }

  getDoctors() {
    this.appService.getAllDoctors()
      .subscribe((res: APIResponse) => {
        if (res.isSuccess) {
          this.doctorsList = res.singleResult
          this.isLoaded = true;
        }
      });
  }

  loadForm(): any {
    return this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      mobile: ['', [Validators.required, Validators.minLength(10)]],
      age: ['', [Validators.required, Validators.maxLength(2)]],
      sex: ['', Validators.required],
      bookingDate: ['', Validators.required],
      bookingTime: ['', Validators.required],
      doctorID: ['', Validators.required],
      companyID: [2]
    });

  }

  reset(): void {
    this.submitted = false;
    this.appointmentForm.reset();
  }

  ngOnInit() {
    this.allTimings = this.jsonService.getTimings();
    this.appointmentForm = this.loadForm();
  }

  get f() {
    return this.appointmentForm.controls;
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.appointmentForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.appService.submitDoctorAppointment(this.appointmentForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.isSuccess) {
          this.status = "Success";
          this.message = res.message;
          this.appService.sendEmailNotification('email-appointment', this.appointmentForm.value);
          this.reset();
          
        } else {
          this.status = "Fail";
          this.message = res.message;
          return;
        }
      },
        err => {
          this.status = "Fail";
          this.message = 'An error occured. Try again later.'
          this.appService.handleError(err);
        });
  }
}
