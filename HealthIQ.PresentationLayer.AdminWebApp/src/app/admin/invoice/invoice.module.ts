import { NgModule } from '@angular/core';
import { CreateInvoiceComponent } from './create-invoice/create-invoice.component';
import { InvoicesListComponent } from './invoices-list/invoices-list.component';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/core/auth/auth-guard';
import { Role } from 'src/app/core/models/role';
import { InvoiceComponent } from './invoice.component';
import { InvoiceService } from './invoice.service';
import { SharedModule } from 'src/app/shared/shared.module';
import { BaseCommonModule } from 'src/app/shared/base.common.module';

export const InvoiceRoutes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    data: { roles: [Role.Admin] },
    children: [
      {
        path: '',
        component: InvoiceComponent
      },
      {
        path: 'invoices-list',
        component: InvoicesListComponent
      },
      {
        path: 'create-invoice',
        component: CreateInvoiceComponent
      }
    ]
  }
];

@NgModule({
  declarations: [CreateInvoiceComponent, InvoicesListComponent, InvoiceComponent],
  imports: [
    BaseCommonModule,
    RouterModule.forChild(InvoiceRoutes)
  ],
  providers: [InvoiceService]
})
export class InvoiceModule { }
