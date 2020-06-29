import { Component, OnInit } from '@angular/core';
import { StudentService } from '../student.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { PrintService } from '../../../app/shared/print/print.service';
import { APIResponse } from '../../../app/core/models';

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css']
})
export class StudentProfileComponent extends BaseFormValidationComponent implements OnInit {

  student: UserMaster;
  formGroup: FormGroup;
  showInvoice = false;
  constructor(private readonly service: StudentService,
    private readonly formBuilder: FormBuilder,
    private readonly print: PrintService) {
    super()
  }

  ngOnInit(): void {
    this.createForm();
    this.service.getStudentData(1).subscribe((user: APIResponse) => {
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
      image: [''],
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

  onPrintInvoice() {
    // const ids = ['101', '102'];
    // this.print.printDocument('invoice', ids);
    this.showInvoice = true;
  }

}
