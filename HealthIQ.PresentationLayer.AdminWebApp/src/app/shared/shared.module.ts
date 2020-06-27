import { NgModule, ModuleWithProviders } from '@angular/core';
import { FieldErrorDisplayComponent } from './components/field-error-display/field-error-display.component';
import { BaseFormValidationComponent } from './components/base-form-validation/base-form-validation.component';
import { BaseCommonModule } from './base.common.module';
import { PrintModule } from '../print/print.module';
import { InvoiceModule } from '../admin/invoice/invoice.module';
import { FooterComponent } from './components/footer/footer.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { UserSharedService } from './components/user/user.shared.service';
import { UserProfileComponent } from './components/user/user-profile.component';

@NgModule({
    imports: [
        BaseCommonModule,
        PrintModule,
        InvoiceModule
    ],
    declarations: [
        FieldErrorDisplayComponent,
        BaseFormValidationComponent,
        UserProfileComponent,
        FooterComponent,
        NavbarComponent,
        SidebarComponent
    ],
    exports: [
        BaseCommonModule,
        FieldErrorDisplayComponent,
        UserProfileComponent,
        FooterComponent,
        NavbarComponent,
        SidebarComponent],
    providers: [UserSharedService]
})

export class SharedModule {
    static forRoot(): ModuleWithProviders {
        return {
            ngModule: SharedModule,
            providers: [

            ]
        };
    }
}
