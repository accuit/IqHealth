import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PrintService } from '../print.service';

@Component({
  selector: 'ipx-invoice',
  templateUrl: './invoice-template.component.html',
  styleUrls:['./invoice-template.component.scss']
})
export class InvoiceTemplateComponent implements OnInit {
  invoiceIds: string[];
  invoiceDetails: Promise<any>[];

  constructor(route: ActivatedRoute,
    private printService: PrintService) {
    // this.invoiceIds = route.snapshot.params['ids']
    //   .split(',');
  }
  @Input('invoice-data') data: any;

  ngOnInit(): void {
    // this.printService.onDataReady();
  }
}