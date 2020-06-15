import { Component, Input } from '@angular/core';

@Component({
  selector: 'ipx-invoice-template',
  templateUrl: './invoice-template.component.html',
})
export class InvoiceTemplateComponent  {

    @Input('invoice-data') data : any;
}