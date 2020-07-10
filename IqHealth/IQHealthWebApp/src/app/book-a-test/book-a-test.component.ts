import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { PackageMaster, APIResponse } from '../core/app.models';
import { AppService } from '../core/app.service';
import { AppJsonService } from '../core/app.json.service';

@Component({
  selector: 'app-book-a-test',
  templateUrl: './book-a-test.component.html',
  styleUrls: ['./book-a-test.component.scss']
})
export class BookATestComponent implements OnInit {

  bookingForm: FormGroup;
  submitted = false;
  inProcess: any;
  showSpinner: boolean;
  allPackages: PackageMaster[];
  isLoaded = false;
  selectedPID: any;
  selectedPText = 'Select Your Package';

  allTimings = [];
  selectedTimeID: any;
  selectedTimeText = 'Choose Booking Time';
  status: string;
  message: string;

  constructor(private formBuilder: FormBuilder, private readonly appService: AppService, private readonly jsonService: AppJsonService) { }

  ngOnInit() {
    this.appService.getPackages().subscribe((res: APIResponse) => {
      this.allPackages = res.singleResult;
    });

    this.allTimings = this.jsonService.getTimings();

    this.bookingForm = this.loadForm();
  }

  loadForm() {
    return this.bookingForm = this.formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', Validators.required],
      mobile: ['', [Validators.required, Validators.minLength(10)]],
      age: ['', [Validators.required, Validators.max(100), Validators.maxLength(2)]],
      sex: ['', Validators.required],
      address: ['', Validators.required],
      bookingDate: ['', Validators.required],
      landmark: ['', Validators.required],
      bookingTime: ['', Validators.required],
      city: ['', Validators.required],
      pincode: [''],
      collectionType: ['', Validators.required],
      testID: [''],
      packageID: ['', Validators.required],
      companyID: [2, Validators.required],
    });
  }

  get f() { return this.bookingForm.controls; }

  onSubmit(): any {
    this.submitted = true;
    if (this.bookingForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.appService.submitBooking(this.bookingForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.isSuccess) {
          this.status = "Success";
          this.message = res.message;
          this.appService.sendEmailNotification('email-booking', this.bookingForm.value);
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
        })

  }

  reset(): void {
    this.submitted = false;
    this.bookingForm.reset();
  }

  selectTiming(time) {
    this.selectedTimeText = time;
    this.bookingForm.controls['bookingTime'].setValue(time);
  }

  selectPackage(packag) {
    this.selectedPID = packag.id;
    this.selectedPText = packag.name;
    this.bookingForm.controls['packageID'].setValue(packag.id);
  }

}
