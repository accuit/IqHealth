import { NgModule } from '@angular/core';
import { AdminRoutes } from './admin.routing';
import { RouterModule } from '@angular/router';
import { AdminComponent } from './admin.component';
import { BaseCommonModule } from '../shared/base.common.module';
import { InvoiceModule } from './invoice/invoice.module';
import { UserModule } from './user/user.module';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [AdminComponent],
  imports: [
    BaseCommonModule,
    RouterModule.forChild(AdminRoutes),
    InvoiceModule,
    UserModule,
    SharedModule
  ]
})
export class AdminModule { }
