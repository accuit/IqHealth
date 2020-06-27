import { Component, OnInit, Input } from '@angular/core';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { tap } from 'rxjs/operators';
import { APIResponse } from 'src/app/core/models';
import { PrintService } from 'src/app/print/print.service';
import { UserSharedService } from './user.shared.service';

@Component({
    selector: 'ipx-user-profile',
    templateUrl: 'user-profile.component.html'
})
export class UserProfileComponent extends BaseFormValidationComponent implements OnInit {

    @Input() type: string = 'info';
    user: UserMaster;
    formGroup: FormGroup;
    showInvoice = false;
    constructor(
        private readonly userService: UserSharedService,
        private readonly formBuilder: FormBuilder,
        private readonly print: PrintService) {
        super()
    }

    ngOnInit(): void {
        this.type = 'info';
        this.createForm();
        this.userService.getLoggedInUserData().subscribe((user: APIResponse) => {
            this.user = user.singleResult;
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

    onPrintInvoice() {
        this.showInvoice = true;
    }

}

