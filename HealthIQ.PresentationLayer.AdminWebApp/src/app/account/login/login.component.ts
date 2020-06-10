import { Component, Inject, PLATFORM_ID, ElementRef, OnDestroy, AfterViewInit } from '@angular/core';
import { Validators, FormBuilder, FormGroup, FormControl, FormGroupDirective, NgForm } from '@angular/forms';
import { AccountService } from '../account.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserMaster } from '../../shared/components/user/user.model';
import { APIResponse } from '../../../app/core/models';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from 'src/app/core/enums';
import { ErrorStateMatcher } from '@angular/material/core';
import { AlertService } from 'src/app/services/alert.service';
import { AuthService } from 'src/app/core/auth/auth.service';
import { error } from '@angular/compiler/src/util';
declare var $: any;

export class MyErrorStateMatcher implements ErrorStateMatcher {
    isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
        const isSubmitted = form && form.submitted;
        return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
    }
}

@Component({
    selector: 'app-login',
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
    returnUrl: string;
    inProgress = false;
    constructor(
        private element: ElementRef,
        private formBuilder: FormBuilder,
        private readonly router: Router,
        private route: ActivatedRoute,
        private readonly core: AlertService,
        private readonly accountService: AccountService,
        private readonly authService: AuthService,
        @Inject(PLATFORM_ID) private platformId: any,
        @Inject('LOCALSTORAGE') private localStorage: any,
    ) {
        if (this.authService.currentUser) {
            this.router.navigate(['/']);
        }

        this.nativeElement = element.nativeElement;
        this.sidebarVisible = false;
    }

    ngOnInit() {
        this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
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
        this.inProgress = true;
        this.authService.login(this.loginForm.value.email, this.loginForm.value.password)
            .subscribe(res => {
                if (res) {
                    this.router.navigate([this.returnUrl]);
                    this.inProgress = false;
                }
            }, () => {
                const alert: SweetAlertOptions = {
                    type: AlertTypeEnum.error as SweetAlertType,
                    title: AlertTitleEnum.Fail,
                    text: 'Something went wrong!'
                }
                this.inProgress = false;
                this.core.showAlert(alert);
            });

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
