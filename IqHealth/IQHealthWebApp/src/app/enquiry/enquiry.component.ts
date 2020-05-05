import { Component, OnInit } from '@angular/core';
import { SubCourses } from '../academy/academy.model';
import { AcademyService } from '../academy/academy.service';
import { APIResponse, Doctor } from '../core/app.models';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { AppService } from '../core/app.service';

@Component({
  selector: 'app-enquiry',
  templateUrl: './enquiry.component.html',
  styleUrls: ['./enquiry.component.scss']
})
export class EnquiryComponent implements OnInit {

  title: string = 'Student Enquiry Form';
  url: string = '#';
  subtitle: string = 'Find Doctors';
  parent: string = 'Home';
  isLoaded = false;
  submitted = false;
  enquiryType: number = 1;
  enquiryTypeName: string = 'General Enquiry Form';
  urlParams: any;
  status: string;
  message: string;

  enquiryForm: FormGroup;

  subCourses: SubCourses[] = [];
  doctors: Doctor[] = [];
  selectedID: any;
  selectedText = 'Select Course';
  showSpinner: boolean;

  constructor(private readonly service: AcademyService,
    private readonly formBuilder: FormBuilder,
    private readonly route: ActivatedRoute,
    private readonly appService: AppService) {
    
      this.route.paramMap.subscribe(params => {
        this.enquiryType = Number(params.get("id"));
      });
  
      if (this.enquiryType === 2){
        this.loadSubCourses();
        this.enquiryTypeName = 'Enquiry For Courses.';
      }
      if (this.enquiryType === 3) {
        this.loadDoctors();
        this.enquiryTypeName = 'Enquiry For Doctors.';
      }
      if (this.enquiryType === 4){
        this.enquiryTypeName = 'Download Our Brouchure';
      }

  }

  reset(): void {
    this.submitted = false;
    this.enquiryForm.reset();
  }

  loadSubCourses() {
    this.service.getSubCourses()
      .subscribe((data: APIResponse) => {
        this.subCourses = data.SingleResult;
        this.isLoaded = true;
      })
  }

  loadDoctors() {
    this.appService.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.subCourses = data.SingleResult;
        this.isLoaded = true;
      })
  }

  ngOnInit() {
    this.loadForm();

  }

  executeParams(): void {
    this.route.queryParams
      .subscribe(params => {
        this.urlParams = params;
        if (params.type) {  // type 1= general type, 2 = course, 3 = doctor type , 4 = download brouchure
          this.enquiryType = params.type;
        }
      });
  }

  get f() { return this.enquiryForm.controls; }

  loadForm(): any {
    this.enquiryForm = this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.minLength(10)]],
      age: [''],
      message: ['', [Validators.required]],
      subject: [this.enquiryTypeName, [Validators.required]],
      type: [this.enquiryType],
      typeValue: [this.selectedID, Validators.required],
      address: [''],
      place: [''],
      city: [''],
      state: [''],
      country: [1],
      captchaText: [''],
      captchaVerified: [0],
      companyID: [2]
    });

  }

  onSubmit(): any {
    this.submitted = true;
    if (this.enquiryForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.service.submitOnlineEnquiry(this.enquiryForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.IsSuccess) {
          this.status = "Success";
          this.message = res.Message;
          this.appService.sendEmailNotification('email-enquiry', this.enquiryForm.value);
          this.reset();
          
        } else {
          this.status = "Fail";
          this.message = res.Message;
          return;
        }

      },
      err => {
        this.status = "Fail";
        this.message = 'An error occured. Try again later.'
        this.appService.handleError(err);
      });
  }

  selectCourse(course: SubCourses) {
    this.selectedID = course.ID;
    this.selectedText = course.Name;
    this.enquiryForm.controls['typeValue'].setValue(this.selectedID)
  }

}
