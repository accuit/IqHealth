import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '../app.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FieldErrorDisplayComponent } from './components/field-error-display/field-error-display.component';
import { BaseFormValidationComponent } from './components/base-form-validation/base-form-validation.component';
import { NouisliderModule } from 'ng2-nouislider';
import { TagInputModule } from 'ngx-chips';
import { UserSharedService } from './components/user/user-shared.service';
import { UserProfileComponent } from './components/user/user-profile.component';
import { PDFExportModule } from '@progress/kendo-angular-pdf-export';
import { IpxModalService } from './components/modal/modal.service';
import { ModalModule } from 'ngx-bootstrap/modal';
import { PrintModule } from './print/print.module';
import { LoaderComponent } from './components/loader/loader.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        NouisliderModule,
        TagInputModule,
        MaterialModule,
        PDFExportModule,
        PrintModule,
        ModalModule.forRoot()
    ],
    declarations: [
        FieldErrorDisplayComponent,
        BaseFormValidationComponent,
        UserProfileComponent,
        LoaderComponent
    ],
    exports: [FieldErrorDisplayComponent, UserProfileComponent],
    providers: [UserSharedService, IpxModalService]
})

export class SharedModule { }
