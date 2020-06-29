import { Component, OnInit } from '@angular/core';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { UserService } from '../../user/user.service';
import { InvoiceService } from '../../../services/invoice.service';
import { StudentInvoice } from '../invoice.model';
import { IpxModalService } from '../../../../app/shared/components/modal/modal.service';
import { AuthService } from '../../../../app/core/auth/auth.service';
import { InvoiceTemplateComponent } from '../../../../app/shared/print/invoice/invoice-template.component';

@Component({
  selector: 'app-invoices-list',
  templateUrl: './invoices-list.component.html',
  styleUrls: ['./invoices-list.component.css']
})
export class InvoicesListComponent implements OnInit {

  invoiceModalRef: any;
  columns: Array<string>;
  invoices: Array<StudentInvoice>;
  userID: number;

  constructor(
    private readonly service: InvoiceService,
    private readonly modalService: IpxModalService,
    private readonly auth: AuthService) { }

  ngOnInit(): void {
    this.userID = this.auth.currentUser? this.auth.currentUser.userID: 0;
    this.service.getAllInvoices().subscribe(res => {
      this.invoices = res.singleResult;
      this.columns = ['ID', 'Billing Name', 'Invoice Date', 'Tax', 'SubTotal', 'Preview'];
    })
  }

  viewInvoice(id): any {
    this.invoiceModalRef = this.modalService.openModal(InvoiceTemplateComponent, {
      animated: false,
      ignoreBackdropClick: true,
      backdrop: 'static',
      class: 'modal-lg',
      initialState: {
        invoiceID : id
      }
    });
  }

}
