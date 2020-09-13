import { Component, OnInit, OnChanges } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { AlertTypeEnum, UserTypeEnum } from 'src/app/core/enums';
import { AlertService } from 'src/app/services/alert.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { UserService } from '../../user/user.service';
import { APIResponse, FileToUpload } from 'src/app/core/models';
import { AuthService } from 'src/app/core/auth/auth.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.css']
})
export class CreateUserComponent extends BaseFormValidationComponent implements OnInit, OnChanges {
  formGroup: FormGroup;
  isVerified = false;
  file: any;
  errMessage: any;
  image: string;
  isEmployee = false;
  IsEditform: boolean = false;
  selectedStudent: UserMaster;
  btnText: string = 'Update User';

  paymentModes = [{ id: 1, name: 'Cash' }, { id: 2, name: 'Card' }, { id: 3, name: 'UPI' }];
  constructor(
    private readonly service: UserService,
    private readonly userService: UserService,
    private readonly authService: AuthService,
    private formBuilder: FormBuilder,
    private readonly alert: AlertService,
    private activaterouter: ActivatedRoute,
    private router: Router) {
    super()


  }

  ngOnInit(): void {
    this.createForm();
    const id = this.activaterouter.snapshot.params.id;
    if (id) 
    {
      //this.btnText = 'Update User';
      this.IsEditform = true; // set true for edit form
      this.service.getUserById(+id).subscribe(res => {
        this.selectedStudent = res;
        // this.selectedStudent = this.students.find(x=>x.userID == +id);
        console.log(this.selectedStudent);
        if (this.selectedStudent.isStudent) {
          this.formGroup.patchValue({ userType: '1' })
        }
        else if (this.selectedStudent.isEmployee) { this.formGroup.patchValue({ userType: '2' }) }
        else if (this.selectedStudent.isCustomer) { this.formGroup.patchValue({ userType: '3' }) }
        this.formGroup.patchValue(this.selectedStudent);
      })
     }
     else {
       //  create component
       this.IsEditform = false; // set true for edit form

      //this.btnText = 'Submit User';
    }
  }
  ngOnChanges() {


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
    console.log(this.formGroup.value);
    if (this.formGroup.invalid) {
      this.validateAllFormFields(this.formGroup);
      return;
    }
    this.inProgress = true;
    this.service.addUpdateUser(this.formGroup.value)
      .subscribe((res: APIResponse) => {
        debugger;
        if (res) {
          this.inProgress = false;
          this.router.navigate(['user/users-list']);
          this.alert.showAlert({ alertType: AlertTypeEnum.success, text: res.message });
        }
        this.inProgress = false;
      });
  }

  onChangeUserType(type): void {
    if (type.value === UserTypeEnum.Student) {
      this.formGroup.patchValue({ isStudent: true });
      this.formGroup.patchValue({ isCustomer: false });
      this.formGroup.patchValue({ isEmployee: false });
      this.isEmployee = false;
    }
    else if (type.value === UserTypeEnum.Customer) {
      this.formGroup.patchValue({ isCustomer: true });
      this.formGroup.patchValue({ isStudent: false });
      this.formGroup.patchValue({ isEmployee: false });
      this.isEmployee = false;
    }
    else {
      this.formGroup.patchValue({ isEmployee: true });
      this.formGroup.patchValue({ isCustomer: false });
      this.formGroup.patchValue({ isStudent: false });
      this.isEmployee = true;
    }
  }

  onFileChange(event) {
    this.file = null;
    if (event.target.files &&
      event.target.files.length > 0) {
      // Don't allow file sizes over 1MB
      if (event.target.files[0].size < this.MAX_FILE_SIZE) {
        this.file = event.target.files[0];
        this.image = this.getimageBase64String(this.file, 'image');
        if (this.image) {
          this.formGroup.patchValue({ image: this.image });
        }
        else {  // Display error message
          this.errMessage.push("File: " +
            event.target.files[0].name
            + " is too large to upload.");
        }
      }
    }
  }

  createForm() {
    this.formGroup = this.formBuilder.group({
      firstName: ['', [Validators.required]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required]],
      mobile: ['', [Validators.required]],
      userCode: [''],
      password: ['123456'],
      imagePath: [''],
      image: [''],
      status: [1],
      pin: [''],
      address: [''],
      city: [''],
      state: [''],
      country: [1],
      userID: [''],
      userType: ['', Validators.required],
      isStudent: [],
      isCustomer: [],
      isEmployee: [],
      isAdmin: [],
      createdDate: ['']
    });
  }
}
