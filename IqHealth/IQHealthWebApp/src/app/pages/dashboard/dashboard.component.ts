import { Component, OnInit } from '@angular/core';
import { AppJsonService } from 'src/app/core/app.json.service';
import { AccountService } from 'src/app/academy/account/account.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UserType } from 'src/app/academy/account/register/register.component';
import { ActivatedRoute } from '@angular/router';
import { APIResponse } from 'src/app/core/app.models';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  uploadForm: FormGroup;
  submitted = false;
  selectedText = 'Select User Type';
  selectedStateText = 'Select Your State';
  inProcess: any;
  userType: any;
  userID: any;
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

  }

  ngOnInit() {
    this.userType = localStorage.getItem('userType');
    this.userID = localStorage.getItem('userID');
    console.log(localStorage.getItem('userID'));
    console.log(localStorage.getItem('userType'));
    this.loadUserDashboard(this.userType);
    this.uploadForm = this.loadForm();
  }

  get f() {
    return this.uploadForm.controls;
  }

  loadForm(): any {
    return this.formBuilder.group({
      customerID: ['', Validators.required],
      comments: ['', Validators.required],
      fileName: ['', Validators.required],
      companyID: [2, Validators.required]
    });

  }

  onSubmit(): any {
    this.submitted = true;
    if (this.uploadForm.invalid) {
      console.log(this.uploadForm);
      return;
    }
    this.inProcess = true;
    this.accountService.registerUser(this.uploadForm.value)
      .subscribe((res: APIResponse) => {
        alert(res.Message);
      });
  }

  selectUserType(user: UserType) {
    this.selectedID = user.ID;
    this.selectedText = user.Text;
    this.uploadForm.controls['userType'].setValue(user.ID);
  }

  loadUserDashboard(usertype: number) {
    if (usertype === 1)
      this.customerDashboard;
      if (usertype === 2)
      this.studentDashboard;
      if (usertype === 3)
      this.employeeDashboard;
  }

  studentDashboard() {

  }

  customerDashboard() {

  }

  employeeDashboard() {

  }

}

