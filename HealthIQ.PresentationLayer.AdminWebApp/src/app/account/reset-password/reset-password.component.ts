import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { AccountService } from '../account.service';
import { Router, ActivatedRoute } from '@angular/router';
import { APIResponse } from '../../../app/core/models';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from 'src/app/core/enums';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AlertService } from 'src/app/services/alert.service';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss']
})
export class ResetPasswordComponent extends BaseFormValidationComponent implements OnInit {

  loginForm: FormGroup;
  forgetForm: FormGroup;
  isSubmitted = false;
  GUID: string;
  user: UserMaster;
  isValidResetUrl = false;
  validEmailLogin: boolean = false;

  constructor(
    private formBuilder: FormBuilder,
    private readonly alert: AlertService,
    private readonly accountService: AccountService,
    private readonly router: Router,
    activatedRoute: ActivatedRoute
  ) {
    super();
    const id: any = activatedRoute.params.pipe(map(p => p.id));
    this.GUID = id ? id.source.value['id'] : '';
  }

  ngOnInit() {
    const body = document.getElementsByTagName('body')[0];
    body.classList.add('register-page');
    body.classList.add('off-canvas-sidebar');

    if (this.GUID) {
      this.accountService.ValidateGUID(this.GUID).subscribe((res: APIResponse) => {
        if (res.isSuccess) {
          this.isValidResetUrl = true;
          this.user = res.singleResult;
          this.loginForm = this.inititalizeResetForm();
        } else {
          this.alert.showAlert({ alertType: AlertTypeEnum.error, text: res.message });
        }
      })
    } else {
      this.forgetForm = this.formBuilder.group({
        userEmail: ['', [Validators.required, Validators.email]]
      })
    }

  }

  inititalizeResetForm(): FormGroup {
    return this.formBuilder.group({
      email: [this.user.email, [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required],
      guid:[this.GUID]
    }, {
      validator: MustMatch('password', 'confirmPassword')
    });
  }

  get f() {
    return this.loginForm.controls;
  }

  onSubmit(): any {
    this.isSubmitted = true;
    if (this.loginForm.invalid) {
      return;
    }
    this.accountService.resetPassword(this.loginForm.value)
      .subscribe((res: APIResponse) => {
        if (res.isSuccess) {
          this.submitSuccessful(res);
        } else {
          this.alert.showAlert({ alertType: AlertTypeEnum.error, title: "Error!", text: res.message});
        }
      });
  }

  onForgetSubmit() {
    this.isSubmitted = true;
    if (this.forgetForm.invalid) {
      return;
    }
    this.accountService.forgetPassword(this.forgetForm.value)
    .subscribe((res: APIResponse) => {
      if (res.isSuccess) {
        this.alert.showAlert({ alertType: AlertTypeEnum.success, title: "Success Reset!", text: 'Password reset email has been sent to you.'});
      } else {
        this.alert.showAlert({ alertType: AlertTypeEnum.error, title: "Error!", text: res.message});
      }
    });
  }

  submitSuccessful(res): void {
    this.alert.showAlert({ alertType: AlertTypeEnum.success, title: "Success!", text: 'Password successfully changed. Click ok to go back to login.'});
    this.loginForm.reset();
    this.router.navigate(['account/login']);
  }

  emailValidationLogin(e) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (re.test(String(e).toLowerCase())) {
      this.validEmailLogin = true;
    } else {
      this.validEmailLogin = false;
    }
  }
}

export function MustMatch(controlName: string, matchingControlName: string) {
  return (formGroup: FormGroup) => {
    const control = formGroup.controls[controlName];
    const matchingControl = formGroup.controls[matchingControlName];

    if (matchingControl.errors && !matchingControl.errors.mustMatch) {
      // return if another validator has already found an error on the matchingControl
      return;
    }

    // set error on matchingControl if validation fails
    if (control.value !== matchingControl.value) {
      matchingControl.setErrors({ mustMatch: true });
    } else {
      matchingControl.setErrors(null);
    }
  }
}
