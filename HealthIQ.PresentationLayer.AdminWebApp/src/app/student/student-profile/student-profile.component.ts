import { Component, OnInit, Input } from '@angular/core';
import { StudentService } from '../student.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';

@Component({
  selector: 'app-student-profile',
  templateUrl: './student-profile.component.html',
  styleUrls: ['./student-profile.component.css']
})
export class StudentProfileComponent extends BaseFormValidationComponent implements OnInit {

  @Input() type: string = 'info';
  user: UserMaster;
  formGroup: FormGroup;
  showInvoice = false;
  constructor(private readonly service: StudentService,
    private readonly formBuilder: FormBuilder) {
    super()
  }

  ngOnInit(): void {
    this.type = 'info';
    this.createForm();
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

  onPrintInvoice() {
    // const ids = ['101', '102'];
    // this.print.printDocument('invoice', ids);
    this.showInvoice = true;
  }

}
