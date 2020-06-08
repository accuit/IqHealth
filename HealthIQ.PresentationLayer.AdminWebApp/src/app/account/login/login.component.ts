import { Component, Inject, PLATFORM_ID, ElementRef, OnDestroy, AfterViewInit } from '@angular/core';
import { Validators, FormBuilder, FormGroup, FormControl, FormGroupDirective, NgForm } from '@angular/forms';
import { AccountService } from '../account.service';
import { Router } from '@angular/router';
import { UserMaster } from '../../../app/user/user.model';
import { APIResponse } from '../../../app/core/models';
import { CoreService } from 'src/app/core/core.service';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from 'src/app/core/enums';
import { ErrorStateMatcher } from '@angular/material/core';
declare var $: any;

export class MyErrorStateMatcher implements ErrorStateMatcher {
    isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
      const isSubmitted = form && form.submitted;
      return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
    }
  }

@Component({
    selector: 'app-login-cmp',
    templateUrl: './login.component.html'
})

export class LoginComponent implements AfterViewInit, OnDestroy {
    test: Date = new Date();
    private toggleButton: any;
    private sidebarVisible: boolean;
    private nativeElement: Node;
    loginForm: FormGroup;
    data: any = [];
    isSubmitted = false;
    matcher = new MyErrorStateMatcher();

    constructor(
        private element: ElementRef,
        private formBuilder: FormBuilder,
        private readonly router: Router,
        private readonly core: CoreService,
        private readonly accountService: AccountService,
        @Inject(PLATFORM_ID) private platformId: any,
        @Inject('LOCALSTORAGE') private localStorage: any,
    ) {
        this.nativeElement = element.nativeElement;
        this.sidebarVisible = false;
    }

    ngOnInit() {
        this.loginForm = this.formBuilder.group({
            email: ['', [Validators.required, Validators.email]],
            password: ['', [Validators.required]]
        });
    }

    get f() {
        return this.loginForm.controls;
    }

    emailFormControl = new FormControl('', [
        Validators.required,
        Validators.email,
    ]);

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

    isFieldValid(form: FormGroup, field: string) {
        return !form.get(field).valid && form.get(field).touched;
    }

    displayFieldCss(form: FormGroup, field: string) {
        return {
            'has-error': this.isFieldValid(form, field),
            'has-feedback': this.isFieldValid(form, field)
        };
    }

    onSubmit(): any {
        this.isSubmitted = true;
        if (this.loginForm.invalid) {
            this.validateAllFormFields(this.loginForm);
            return;
        }
        this.accountService.loginUser(this.loginForm.value)
            .subscribe((res: APIResponse) => {
                if (res.isSuccess) {
                    this.authorizeUser(res.singleResult)
                } else {
                    const alert: SweetAlertOptions = {
                        type: AlertTypeEnum.error as SweetAlertType,
                        title: AlertTitleEnum.Fail,
                        text: res.message
                      }
                    this.core.showAlert(alert);
                }
            });
    }

    authorizeUser(user: UserMaster): void {
        this.core.isAuthorized$.next(true);
        this.core.authorizedUser$.next(user);
        this.saveInLocal('userID', user.userID);
        this.saveInLocal('userName', (user.firstName + ' ' + user.lastName));
        this.saveInLocal('isAuthorized', true);
        this.router.navigate(['dashboard']);
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

    passwordValidationLogin(e) {
        if (e.length > 5) {
            this.validPasswordLogin = true;
        } else {
            this.validPasswordLogin = false;
        }
    }

    emailValidationLogin(e) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (re.test(String(e).toLowerCase())) {
            this.validEmailLogin = true;
        } else {
            this.validEmailLogin = false;
        }
    }

    saveInLocal(key, val): void {
        localStorage.setItem(key, val);
        this.data[key] = localStorage.getItem(key);
    }

    ngAfterViewInit() {
        var navbar: HTMLElement = this.element.nativeElement;
        this.toggleButton = navbar.getElementsByClassName('navbar-toggle')[0];
        const body = document.getElementsByTagName('body')[0];
        body.classList.add('login-page');
        body.classList.add('off-canvas-sidebar');
        const card = document.getElementsByClassName('card')[0];
        setTimeout(function () {
            // after 1000 ms we add the class animated to the login/register card
            card.classList.remove('card-hidden');
        }, 700);
    }

    ngOnDestroy() {
        const body = document.getElementsByTagName('body')[0];
        body.classList.remove('login-page');
        body.classList.remove('off-canvas-sidebar');
    }
}
