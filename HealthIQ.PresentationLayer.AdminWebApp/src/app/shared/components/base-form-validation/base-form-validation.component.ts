import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, NgForm, FormGroupDirective, AbstractControl, FormBuilder } from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material/core';

@Component({
  selector: 'app-base-form-validation',
  templateUrl: './base-form-validation.component.html',
  styleUrls: ['./base-form-validation.component.css']
})
export class BaseFormValidationComponent {

  isSubmitted = false;
  inProgress = false;
  cities = [{ id: 1, name: 'Kolkata' }, { id: 2, name: 'Sydney' }, { id: 3, name: 'Dhaka' }];
  states = [{ id: 1, name: 'West Bengal' }, { id: 2, name: 'Sydney' }, { id: 3, name: 'Dhaka' }];
  countries = [{ id: 1, name: 'India' }, { id: 2, name: 'Bangladesh' }, { id: 3, name: 'Australia' }];
  
  validEmailRegister: boolean = false;
  validConfirmPasswordRegister: boolean = false;
  validPasswordRegister: boolean = false;

  validEmailLogin: boolean = false;
  validPasswordLogin: boolean = false;

  validTextType: boolean = false;
  validEmailType: boolean = false;
  validNumberType: boolean = false;
  validUrlType: boolean = false;
  pattern = "https?://.+";
  validSourceType: boolean = false;
  validDestinationType: boolean = false;
  matcher = new MyErrorStateMatcher();
  constructor() { }


  isFieldValid(form: FormGroup, field: string) {
    return !form.get(field).valid && form.get(field).touched;
  }

  displayFieldCss(form: FormGroup, field: string) {
    return {
      'has-error': this.isFieldValid(form, field),
      'has-feedback': this.isFieldValid(form, field)
    };
  }

  PasswordValidation(control: AbstractControl) {
    if (control.value.length > 0 && control.value.length < 6) {
      control.setErrors({ notValid: true })
      return true;
    } else {
      return null;
    }
  }

  EmailValidation(control: AbstractControl) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (re.test(String(control.value).toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }

  MatchStringValidator(control: AbstractControl) {
    const password = control.get('password').value; // to get value in input tag
    const confirmPassword = control.get('confirmPassword').value; // to get value in input tag
    if (password !== confirmPassword) {
      control.get('confirmPassword').setErrors({ MatchPassword: true });
    } else {
      return null;
    }
  }

  validateAllFormFields(formGroup: FormGroup) {
    Object.keys(formGroup.controls).forEach(field => {
      const control = formGroup.get(field);
      if (control instanceof FormControl) {
        control.markAsTouched({ onlySelf: true });
      } else if (control instanceof FormGroup) {
        this.validateAllFormFields(control);
      }
    });
  }

}

export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const isSubmitted = form && form.submitted;
    return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
  }
}
