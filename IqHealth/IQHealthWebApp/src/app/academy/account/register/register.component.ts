import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { AppService } from 'src/app/core/app.service';
import { ActivatedRoute } from '@angular/router';
import { IndianState, AppJsonService } from 'src/app/core/app.json.service';
import { APIResponse } from 'src/app/core/app.models';
import { AccountService } from '../account.service';

export class UserType {
  ID: number;
  Text: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup;
  submitted = false;
  selectedText = 'Select User Type';
  selectedStateText= 'Select Your State';
  inProcess: any;
  userType: any;
  users: UserType[] = [
    { ID: 1, Text: 'Customer' },
    { ID: 2, Text: 'Student' },
    { ID: 3, Text: 'Employee' }
  ];
  states: any;
  selectedID: any;
  selectedStateID: any;

  constructor(
    private formBuilder: FormBuilder,
    private readonly accountService: AccountService,
    private readonly jsonService: AppJsonService,
    private readonly route: ActivatedRoute) {

    this.route.paramMap.subscribe(params => {
      this.userType = params.get("id");
      console.log(this.userType)
    });

  }

  ngOnInit() {
    this.states = this.jsonService.getAllIndianStates();
    this.registerForm = this.loadForm();
  }

  get f() {
    return this.registerForm.controls;
  }

  loadForm(): any {
    return this.formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      // userName: [this.f.email.value],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      // confirmPassword: ['', [Validators.required]],
      mobile: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(15)]],
      address: [''],
      city: [''],
      state: [''],
      userType: ['', Validators.required],
      companyID: [2, Validators.required]
    });

  }

  onSubmit(): any {
    this.submitted = true;
    if (this.registerForm.invalid) {
      console.log(this.registerForm);
      return;
    }
    this.inProcess = true;
    this.accountService.registerUser(this.registerForm.value)
      .subscribe((res: APIResponse) => {
        alert(res.Message);
        // if (res.IsSuccess) {
        //   this.appService.sendEmailNotification('api/notification/email-appointment', this.registerForm.value);
        // }

      });
  }

  selectUserType(user: UserType) {
    this.selectedID = user.ID;
    this.selectedText = user.Text;
    this.registerForm.controls['userType'].setValue(user.ID);
  }

  selectState(state: IndianState) {
    this.selectedStateID = state.id;
    this.selectedStateText = state.name;
    this.registerForm.controls['state'].setValue(state.id);
  }

}
