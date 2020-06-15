import { Component, OnInit } from '@angular/core';
import { StudentService } from '../student.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { tap } from 'rxjs/operators';
import { APIResponse } from 'src/app/core/models';

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css']
})
export class StudentProfileComponent extends BaseFormValidationComponent implements OnInit {

  student: UserMaster;
  formGroup: FormGroup;
  constructor(private readonly service: StudentService,
    private readonly formBuilder: FormBuilder) {
    super()
  }

  ngOnInit(): void {
    this.createForm();
    this.service.getStudentData(1).subscribe(user => {
      this.student = user.singleResult;
      this.formGroup.patchValue(user.singleResult)
    });
  }

  createForm() {
    this.formGroup = this.formBuilder.group({
      firstName: ['', [Validators.required]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required]],
      mobile: ['', [Validators.required]],
      userCode: [''],
      imageUrl: [''],
      status: [1],
      pinCode: [''],
      copyemail: [''],
      address: [''],
      city: [''],
      state: [''],
      pin: [''],
      country: [1],
      userID: [''],
      createdDate: ['']
    });
  }

}
