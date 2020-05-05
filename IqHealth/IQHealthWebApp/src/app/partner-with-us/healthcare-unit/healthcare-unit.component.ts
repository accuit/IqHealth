import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { APIResponse } from 'src/app/core/app.models';
import { PartnerService } from '../partner.service';
import { AppService } from 'src/app/core/app.service';

@Component({
  selector: 'app-healthcare-unit',
  templateUrl: './healthcare-unit.component.html',
  styleUrls: ['./healthcare-unit.component.scss']
})
export class HealthcareUnitComponent implements OnInit {

  partnerForm: FormGroup;
  submitted = false;
  showSpinner: boolean;
  status: string;
  message: any;
  allCities: any;
  selectedCityText = 'Select City';

  constructor(private formBuilder: FormBuilder, private readonly service: PartnerService,
    private readonly notificationService: AppService) { }

  ngOnInit() {
    this.partnerForm = this.loadForm();
    this.allCities = this.notificationService.getAllCities();
  }

  loadForm(): FormGroup {
    return this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      mobile: ['', [Validators.required, Validators.minLength(10)]],
      address: [''],
      city: [''],
      state: [''],
      companyID: [2]
    });

  }

  reset(): void {
    this.submitted = false;
    this.partnerForm.reset();
  }

  get f() {
    return this.partnerForm.controls;
  }

  selectCity(city) {
    this.selectedCityText = city.Name;
    this.partnerForm.controls['city'].setValue(city.id);
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.partnerForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.service.submitPartnerEnquiry(this.partnerForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.IsSuccess) {
          this.status = "Success";
          this.message = res.Message;
          this.notificationService.sendEmailNotification('email-appointment', this.partnerForm.value);
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
          //this.appService.handleError(err);
        });
  }


}
