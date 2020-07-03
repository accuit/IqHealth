import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { AlertTypeEnum, UserTypeEnum } from 'src/app/core/enums';
import { AlertService } from 'src/app/services/alert.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { UserService } from '../../user/user.service';
import { APIResponse, FileToUpload } from 'src/app/core/models';
import { AuthService } from 'src/app/core/auth/auth.service';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.css']
})
export class CreateUserComponent extends BaseFormValidationComponent implements OnInit {
  formGroup: FormGroup;
  isVerified = false;
  file: any;
  errMessage: any;
  image: string;
  isEmployee = false;

  paymentModes = [{ id: 1, name: 'Cash' }, { id: 2, name: 'Card' }, { id: 3, name: 'UPI' }];
  constructor(
    private readonly service: UserService,
    private readonly userService: UserService,
    private readonly authService: AuthService,
    private formBuilder: FormBuilder,
    private readonly alert: AlertService) {
    super()
  }

  ngOnInit(): void {
    this.createForm();
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
    if (this.formGroup.invalid) {
      this.validateAllFormFields(this.formGroup);
      return;
    }
    this.inProgress = true;
    this.service.addUpdateUser(this.formGroup.value)
      .subscribe((res: APIResponse) => {
        if (res) {
          this.inProgress = false;
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
