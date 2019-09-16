import { Component, OnInit } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { AppService } from 'src/app/core/app.service';
import { APIResponse } from 'src/app/core/app.models';
import { AccountService } from '../account.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

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
    this.accountService.loginUser(this.loginForm.value)
      .subscribe((res: APIResponse) => {
        alert(this.loginForm.value);
      });
  }

}
