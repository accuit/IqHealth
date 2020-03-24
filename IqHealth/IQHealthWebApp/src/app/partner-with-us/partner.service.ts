import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { throwError } from 'rxjs';
import { environment } from '../../environments/environment';
import { PartnerRequest } from './partner.model';

@Injectable()
export class PartnerService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;

  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'True'
    });
  }

  submitPartnerRequest(params: PartnerRequest): any {
    return this.httpClient.post(this.baseUrl + 'api/bookings/new-appointment', params, { headers: this.headers })
  }

}