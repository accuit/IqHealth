import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PrintLayoutComponent } from './print-layout/print-layout.component';
import { PrintService } from './print.service';
import { InvoiceTemplateComponent } from './invoice/invoice-template.component';
import { InvoiceRoutes } from '../admin/invoice/invoice.module';
import { PDFExportModule } from '@progress/kendo-angular-pdf-export';
import { BaseCommonModule } from '../shared/base.common.module';


export const PrintRoutes: Routes = [
  {
    path: '',
    children: [
      {
        path: '',
        component: InvoiceTemplateComponent
      },
      {
        path: 'invoice/:ids',
        component: InvoiceTemplateComponent
      }
    ]
  }
];

@NgModule({
  declarations: [PrintLayoutComponent, InvoiceTemplateComponent],
  imports: [
    BaseCommonModule,
    RouterModule.forChild(InvoiceRoutes),
    PDFExportModule
  ],
  providers: [PrintService],
  exports: [InvoiceTemplateComponent]
})
export class PrintModule { }
