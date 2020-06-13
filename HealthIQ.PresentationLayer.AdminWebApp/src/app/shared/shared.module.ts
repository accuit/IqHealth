import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '../app.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FieldErrorDisplayComponent } from './components/field-error-display/field-error-display.component';
import { BaseFormValidationComponent } from './components/base-form-validation/base-form-validation.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        MaterialModule,
        ReactiveFormsModule
    ],
    declarations: [
        FieldErrorDisplayComponent,
        BaseFormValidationComponent
    ],
    exports: [FieldErrorDisplayComponent]
})

export class SharedModule { }
