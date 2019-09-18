import { Component, OnInit, Inject, PLATFORM_ID } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { AppService } from 'src/app/core/app.service';
import { APIResponse, UserMaster } from 'src/app/core/app.models';
import { AccountService } from '../account.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
  data:any=[];
  constructor(
    private formBuilder: FormBuilder,
    private readonly router: Router,
    private readonly accountService: AccountService,
    @Inject(PLATFORM_ID) private platformId: any,
    @Inject('LOCALSTORAGE') private localStorage: any,
  ) { }

  ngOnInit() {

    this.loginForm = this.formBuilder.group({
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
        if (res.IsSuccess) {
          const user: UserMaster = res.SingleResult;
          this.saveInLocal('userID', user.ID );
          this.saveInLocal('userType', user.UserType );
          this.saveInLocal('companyID', 2 );
          this.router.navigate(['dashboard']);
        } else {
          alert(res.Message);
        }

      });
  }

  saveInLocal(key, val): void {
    localStorage.setItem(key, val);
    this.data[key]= localStorage.getItem(key);
   }

}
