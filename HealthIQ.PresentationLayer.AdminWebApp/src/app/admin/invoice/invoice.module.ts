import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CreateInvoiceComponent } from './create-invoice/create-invoice.component';
import { InvoicesListComponent } from './invoices-list/invoices-list.component';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/core/auth/auth-guard';
import { Role } from 'src/app/core/models/role';
import { InvoiceComponent } from './invoice.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../../../app/app.module';
import { NouisliderModule } from 'ng2-nouislider';
import { TagInputModule } from 'ngx-chips';
import { SharedModule } from 'src/app/shared/shared.module';

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
    CommonModule,
    RouterModule.forChild(InvoiceRoutes),
    FormsModule,
    ReactiveFormsModule,
    NouisliderModule,
    TagInputModule,
    MaterialModule,
    SharedModule
  ],
  providers: []
})
export class InvoiceModule { }
