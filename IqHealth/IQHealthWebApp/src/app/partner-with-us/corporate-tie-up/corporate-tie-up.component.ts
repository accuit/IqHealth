import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { APIResponse } from 'src/app/core/app.models';
import { PartnerService } from '../partner.service';
import { AppService } from 'src/app/core/app.service';

@Component({
  selector: 'app-corporate-tie-up',
  templateUrl: './corporate-tie-up.component.html',
  styleUrls: ['./corporate-tie-up.component.scss']
})
export class CorporateTieUpComponent implements OnInit {

  partnerForm: FormGroup;
  submitted = false;
  showSpinner: boolean;
  status: string;
  message: any;
  allDesignations: any;
  selectedDesignationText = 'Select Designation';

  constructor(private formBuilder: FormBuilder, private readonly service: PartnerService,
    private readonly notificationService: AppService) { }

  ngOnInit() {
    this.partnerForm = this.loadForm();
    this.allDesignations = this.notificationService.getAllDesignation();
  }

  loadForm(): FormGroup {
    return this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      mobile: ['', [Validators.required, Validators.minLength(10)]],
      companyName: ['', [Validators.required, Validators.maxLength(100)]],
      designation: [''],
      message:['', [Validators.required, Validators.maxLength(1000)]],
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

  selectDesignation(des) {
    this.selectedDesignationText = des;
    this.partnerForm.controls['designation'].setValue(des);
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.partnerForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.service.submitPartnerRequest(this.partnerForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.IsSuccess) {
          this.status = "Success";
          this.message = res.Message;
          this.notificationService.sendEmailNotification('api/notification/email-appointment', this.partnerForm.value);
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
