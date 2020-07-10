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

  corporateForm: FormGroup;
  submitted = false;
  showSpinner: boolean;
  status: string;
  message: any;
  allDesignations: any;
  selectedDesignationText = 'Select designation';

  constructor(private formBuilder: FormBuilder, private readonly service: PartnerService,
    private readonly notificationService: AppService) { }

  ngOnInit() {
    this.corporateForm = this.loadForm();
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
    this.corporateForm.reset();
    this.showSpinner = false;
  }

  get f() {
    return this.corporateForm.controls;
  }

  selectDesignation(des) {
    this.selectedDesignationText = des.name;
    this.corporateForm.controls['designation'].setValue(des.id);
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.corporateForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.corporateForm.patchValue({ companyID: 2 })
    this.service.submitCorporateEnquiry(this.corporateForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.isSuccess) {
          this.status = "Success";
          this.message = res.message;
          this.notificationService.sendEmailNotification('send-corporate-email', this.corporateForm.value);
          this.reset();
          
        } else {
          this.status = "Fail";
          this.message = res.message;
          return;
        }
      });
  }
}
