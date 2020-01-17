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
  inProcess: any;
  showSpinner: boolean;
  doctorsList: Doctor[];
  isOpd = false;
  isLoaded = false;
  selectedID: any;
  selectedText = 'Select Doctors';

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
    this.selectedID = doctor.ID;
    this.selectedText = doctor.FirstName;
    this.appointmentForm.controls['doctorID'].setValue(doctor.ID);
  }

  selectTiming(time) {
    this.selectedTimeText = time;
    this.appointmentForm.controls['bookingTime'].setValue(time);
  }

  getDoctors() {
    this.appService.getAllDoctors()
      .subscribe((res: APIResponse) => {
        if (res.IsSuccess) {
          this.doctorsList = res.SingleResult
          this.isLoaded = true;
        }
      });
  }

  loadForm(): any {
    return this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      mobile: ['', [Validators.required, Validators.minLength(10)]],
      age: ['', Validators.maxLength(2)],
      sex: [''],
      bookingDate: ['', Validators.required],
      bookingTime: ['', Validators.required],
      doctorID: ['', Validators.required],
      companyID: [2]
    });

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
    this.inProcess = true;
    this.showSpinner = true;
    this.appService.submitDoctorAppointment(this.appointmentForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.IsSuccess) {
          this.appService.sendEmailNotification('api/notification/email-appointment', this.appointmentForm.value);
        }
        this.appointmentForm.reset();
      });
  }
}
