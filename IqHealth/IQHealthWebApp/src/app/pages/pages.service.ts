import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { APIResponse } from '../core/app.models';

@Injectable({
  providedIn: 'root'
})
export class PagesService {
  headers: HttpHeaders;
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*'
    });
  }

  uploadCustomerReport(files: File[], customerID: string, userID): Observable<any> {
    const formData: FormData = new FormData();
    Array.from(files).forEach(f => formData.append('file', f))

    formData.append('customerID', customerID);
    formData.append('userID', userID);
    return this.http.post(this.baseUrl + 'api/employee/upload-report', formData, { reportProgress: true, observe: 'events' });
  }

  getCustomerReports(userID, company) {
    return this.http.get(this.baseUrl + 'api/customer/download-reports/' + userID );
  }
}
