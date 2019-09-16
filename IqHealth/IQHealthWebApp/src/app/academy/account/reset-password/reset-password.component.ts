import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { AccountService } from '../account.service';
import { APIResponse } from 'src/app/core/app.models';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss']
})
export class ResetPasswordComponent implements OnInit {

  loginForm: FormGroup;
  constructor(
    private formBuilder: FormBuilder,
    private readonly accountService: AccountService,
  ) { }

  ngOnInit() {

    this.loginForm =  this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      username: [''],
      password: ['', [Validators.required]],
      confirmPassword: ['', [Validators.required]],
      companyID: [2, Validators.required]
    });
  }


  get f() {
    return this.loginForm.controls;
  }


  onSubmit(): any {

    if (this.loginForm.invalid) {
      console.log(this.loginForm);
      return;
    }
    this.accountService.resetPassword(this.loginForm.value)
      .subscribe((res: APIResponse) => {
        alert(res.Message);
      });
  }

}
