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
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
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

export class LoginComponent extends BaseFormValidationComponent implements AfterViewInit, OnDestroy {
    test: Date = new Date();
    private toggleButton: any;
    private sidebarVisible: boolean;
    private nativeElement: Node;
    loginForm: FormGroup;
    data: any = [];
    isSubmitted = false;
    returnUrl: string;
    inProgress = false;
    pattern = "https?://.+";
    constructor(
        private element: ElementRef,
        private formBuilder: FormBuilder,
        private readonly router: Router,
        private route: ActivatedRoute,
        private readonly alert: AlertService,
        private readonly authService: AuthService,
        @Inject(PLATFORM_ID) private platformId: any,
        @Inject('LOCALSTORAGE') private localStorage: any,
    ) {
        super();
        if (this.authService.currentUser) {
            this.router.navigate(['/']);
        }
        this.nativeElement = element.nativeElement;
        this.sidebarVisible = false;
    }

    ngOnInit() {
        this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
        this.loginForm = this.formBuilder.group({
            email: ['', [Validators.required, Validators.email, this.EmailValidation]],
            password: ['', [Validators.required, this.PasswordValidation]]
        });
    }

    get f() {
        return this.loginForm.controls;
    }

    onSubmit(): any {
        this.isSubmitted = true;
        if (this.loginForm.invalid) {
            this.validateAllFormFields(this.loginForm);
            return;
        }
        this.inProgress = true;
        this.authService.login(this.loginForm.value.email, this.loginForm.value.password)
            .toPromise().then(res => {
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
                this.alert.showAlert({ alertType: AlertTypeEnum.error, text: 'Something went wrong!' });
            });
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
