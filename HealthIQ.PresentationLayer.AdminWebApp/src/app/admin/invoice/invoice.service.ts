import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable()
export class InvoiceService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;
  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'True'
    });
  }

  getAllInvoices(): any {
    return this.httpClient.get(this.baseUrl + 'student/get-invoice', { headers: this.headers });
  }

  createInvoice(invoice: any) {
    return this.httpClient.post(this.baseUrl + 'student/create-invoice', invoice, { headers: this.headers });
  }

}