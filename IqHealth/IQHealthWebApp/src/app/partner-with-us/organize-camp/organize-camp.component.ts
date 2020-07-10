import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { APIResponse } from 'src/app/core/app.models';
import { PartnerService } from '../partner.service';
import { AppService } from 'src/app/core/app.service';
import { AppJsonService } from 'src/app/core/app.json.service';

@Component({
  selector: 'app-organize-camp',
  templateUrl: './organize-camp.component.html',
  styleUrls: ['./organize-camp.component.scss']
})
export class OrganizeCampComponent implements OnInit {

  organizeCampForm: FormGroup;
  submitted = false;
  showSpinner: boolean;
  status: string;
  message: any;
  allCities: any;
  selectedCityText = 'Select City';
  services: any;

  constructor(private formBuilder: FormBuilder, private readonly service: PartnerService,
    private readonly notificationService: AppService, private readonly jsonService: AppJsonService) { }

  ngOnInit() {
    this.organizeCampForm = this.loadForm();
    this.allCities = this.notificationService.getAllCities();
    this.services = this.jsonService.getAllServices();

  }

  loadForm(): FormGroup {
    return this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      mobile: ['', [Validators.required, Validators.minLength(10)]],
      address: [''],
      city: [''],
      state: [''],
      expectedCount:['', Validators.required],
      companyID: [2]
    });

  }

  reset(): void {
    this.submitted = false;
    this.organizeCampForm.reset();
  }

  get f() {
    return this.organizeCampForm.controls;
  }

  selectCity(city) {
    this.selectedCityText = city.name;
    this.organizeCampForm.controls['city'].setValue(city.id);
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.organizeCampForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.service.submitOrganizeCampEnquiry(this.organizeCampForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.isSuccess) {
          this.status = "Success";
          this.message = res.message;
          this.notificationService.sendEmailNotification('email-appointment', this.organizeCampForm.value);
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
          //this.appService.handleError(err);
        });
  }



}
