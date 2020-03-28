import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { throwError } from 'rxjs';
import { environment } from '../../environments/environment';
import { PartnerRequest, OrganizeCamp, CorporateTieUp } from './partner.model';
import { CorporateTieUpComponent } from './corporate-tie-up/corporate-tie-up.component';

@Injectable()
export class PartnerService {

  baseUrl = environment.apiUrl + 'api/enquiry/';
  headers: HttpHeaders;

  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'True'
    });
  }

  submitPartnerEnquiry(params: PartnerRequest): any {
    return this.httpClient.post(this.baseUrl + 'partner-enquiry', params, { headers: this.headers })
  }

  submitCorporateEnquiry(params: CorporateTieUp): any {
    return this.httpClient.post(this.baseUrl + 'corporate-enquiry', params, { headers: this.headers })
  }

  submitOrganizeCampEnquiry(params: OrganizeCamp): any {
    return this.httpClient.post(this.baseUrl + 'organize-camp-enquiry', params, { headers: this.headers })
  }

}