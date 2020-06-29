import { Component, OnInit, Input } from '@angular/core';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { tap } from 'rxjs/operators';
import { APIResponse } from 'src/app/core/models';
import { UserSharedService } from './user-shared.service';
import { PrintService } from '../../print/print.service';
import { InvoiceService } from 'src/app/services/invoice.service';
import { IpxModalService } from '../modal/modal.service';
import { InvoiceTemplateComponent } from '../../print/invoice/invoice-template.component';

@Component({
    selector: 'ipx-user-profile',
    templateUrl: 'user-profile.component.html'
})
export class UserProfileComponent extends BaseFormValidationComponent implements OnInit {

    @Input() type: string = 'info';
    user: UserMaster;
    formGroup: FormGroup;
    showInvoice = false;
    invoices: any;
    columns: any;

    constructor(
        private readonly userService: UserSharedService,
        private readonly formBuilder: FormBuilder,
        private readonly modalService: IpxModalService,
        private readonly service: InvoiceService) {
        super()
    }

    ngOnInit(): void {
        this.type = 'info';
        this.createForm();
        this.userService.getLoggedInUserData().subscribe((user: APIResponse) => {
            this.user = user.singleResult;
            this.formGroup.patchValue(user.singleResult);
            this.getInvoices(this.user.userID);
        });

    }

    getInvoices(id) {
        this.service.getUserInvoices(this.user.userID).subscribe(res => {
            this.invoices = res.singleResult;
            this.columns = ['ID', 'Billing Name', 'Invoice Date', 'Tax', 'SubTotal', 'Preview'];
        })
    }

    onClose(): void {
        this.showInvoice = false;
    }

    viewInvoice(id): any {
        this.modalService.openModal(InvoiceTemplateComponent, {
            animated: false,
            ignoreBackdropClick: true,
            backdrop: 'static',
            class: 'modal-lg',
            initialState: {
                invoiceID: id
            }
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

}

