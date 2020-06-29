import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { PrintLayoutComponent } from './print-layout/print-layout.component';
import { PrintService } from './print.service';
import { InvoiceTemplateComponent } from './invoice/invoice-template.component';
import { PDFExportModule } from '@progress/kendo-angular-pdf-export';

@NgModule({
  declarations: [PrintLayoutComponent, InvoiceTemplateComponent],
  imports: [
    CommonModule,
    PDFExportModule
  ],
  providers: [PrintService],
  exports: [InvoiceTemplateComponent, PDFExportModule]
})
export class PrintModule { }
