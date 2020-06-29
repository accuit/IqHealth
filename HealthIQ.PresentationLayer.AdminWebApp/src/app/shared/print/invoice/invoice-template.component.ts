import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { IpxModalService } from '../../../../app/shared/components/modal/modal.service';
import { InvoiceService } from '../../../../app/services/invoice.service';

@Component({
  selector: 'ipx-invoice-template',
  templateUrl: './invoice-template.component.html',
  styleUrls: ['./invoice-template.component.css']
})
export class InvoiceTemplateComponent implements OnInit {
  invoiceID: number;
  invoiceDetails: any;

  constructor(
    private readonly route: ActivatedRoute,
    private readonly modalService: IpxModalService,
    private readonly service: InvoiceService) {
  }
  @Input('invoice-data') invoice: any;
  @Output() closeModal : EventEmitter<any> = new EventEmitter();

  ngOnInit(): void {
    this.service.getInvoiceDetails(this.invoiceID).subscribe(res => {
      this.invoice = res.isSuccess ? res.singleResult : null;
    })
  }

  onClose() {
    this.closeModal.emit();
    this.modalService.closeModal();
  }
}