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

  constructor(private formBuilder: FormBuilder, private readonly appService: AppService, private readonly jsonService: AppJsonService) { }

  ngOnInit() {
    this.appService.getPackages().subscribe((res: APIResponse) => {
      this.allPackages = res.SingleResult;
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
        alert(res.Message);
        if (res.IsSuccess) {
          //  this.appService.sendEmailNotification('api/notification/email-booking', this.bookingForm.value);
        }
      },
        err => {
          this.appService.handleError(err);
        })

  }

  selectTiming(time) {
    this.selectedTimeText = time;
    this.bookingForm.controls['bookingTime'].setValue(time);
  }

  selectPackage(packag) {
    this.selectedPID = packag.ID;
    this.selectedPText = packag.Name;
    this.bookingForm.controls['packageID'].setValue(packag.ID);
  }

}
