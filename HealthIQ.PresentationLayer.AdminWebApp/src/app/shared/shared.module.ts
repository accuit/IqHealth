import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '../app.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FieldErrorDisplayComponent } from './components/field-error-display/field-error-display.component';
import { BaseFormValidationComponent } from './components/base-form-validation/base-form-validation.component';
import { NouisliderModule } from 'ng2-nouislider';
import { TagInputModule } from 'ngx-chips';
import { InvoiceTemplateComponent } from '../print/invoice/invoice-template.component';
import { UserSharedService } from './components/user/user-shared.service';
import { UserProfileComponent } from './components/user/user-profile.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        NouisliderModule,
        TagInputModule,
        MaterialModule
    ],
    declarations: [
        FieldErrorDisplayComponent,
        BaseFormValidationComponent,
        UserProfileComponent
    ],
    exports: [FieldErrorDisplayComponent, UserProfileComponent],
    providers: [UserSharedService]
})

export class SharedModule { }
