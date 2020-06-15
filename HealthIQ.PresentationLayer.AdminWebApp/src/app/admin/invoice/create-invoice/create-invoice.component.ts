import { Component, OnInit } from '@angular/core';
import { InvoiceService } from '../invoice.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from 'src/app/core/enums';
import { AlertService } from 'src/app/services/alert.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { UserService } from '../../user/user.service';

@Component({
  selector: 'app-create-invoice',
  templateUrl: './create-invoice.component.html',
  styleUrls: ['./create-invoice.component.css']
})
export class CreateInvoiceComponent extends BaseFormValidationComponent implements OnInit {
  students: Array<UserMaster>;
  formGroup: FormGroup;
  isVerified = false;

  paymentModes = [{ id: 1, name: 'Cash' }, { id: 2, name: 'Card' }, { id: 3, name: 'UPI' }];
  constructor(
    private readonly service: InvoiceService,
    private readonly userService: UserService,
    private formBuilder: FormBuilder,
    private readonly alert: AlertService) {
    super()
  }

  ngOnInit(): void {
    this.createInvoiceForm();
    this.userService.getStudents()
      .subscribe(result => {
        this.students = result;
      })
  }

  get f() {
    return this.formGroup.controls;
  }

  checkVerified = () => {
    this.isVerified = !this.isVerified;
    return this.isVerified;
  };

  onSubmit(): any {
    this.isSubmitted = true;
    if (this.formGroup.invalid) {
      this.validateAllFormFields(this.formGroup);
      return;
    }
    this.inProgress = true;
    this.service.createInvoice(this.formGroup.value)
      .subscribe(res => {
        if (res) {
          this.inProgress = false;
        }
      }, () => {
        const alert: SweetAlertOptions = {
          type: AlertTypeEnum.error as SweetAlertType,
          title: AlertTitleEnum.Fail,
          text: 'Something went wrong!'
        }
        this.inProgress = false;
        this.alert.showAlert(alert);
      });
  }

  createInvoiceForm() {
    this.formGroup = this.formBuilder.group({

      name: ['', [Validators.required]],
      invoiceDate: ['', [Validators.required]],
      subTotal: ['', [Validators.required]],
      tax: [''],
      status: [1],
      paymentStatus: [''],
      paymentMode: [''],
      copyemail: [''],
      address: [''],
      city: [''],
      state: [''],
      pin: [''],
      country: [1],
      mobile: [''],
      userID: ['']
    });
  }

}
