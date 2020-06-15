import { Component, OnInit } from '@angular/core';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { UserService } from '../../user/user.service';
import { InvoiceService } from '../invoice.service';
import { StudentInvoice } from '../invoice.model';

@Component({
  selector: 'app-invoices-list',
  templateUrl: './invoices-list.component.html',
  styleUrls: ['./invoices-list.component.css']
})
export class InvoicesListComponent implements OnInit {

  constructor(private readonly service: InvoiceService) { }

  columns: Array<string>;
  invoices: Array<StudentInvoice>;
  ngOnInit(): void {
    this.service.getUserInvoices(5).subscribe(res => {
      this.invoices = res.singleResult;
      this.columns = ['ID', 'Billing Name', 'Invoice Date', 'Billing Address', 'Tax', 'SubTotal'];
    })
  }
}
