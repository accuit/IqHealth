import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { APIResponse } from '../core/app.models';
import { map } from 'rxjs/operators';

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
    return this.http.post(this.baseUrl + 'api/reports/upload-diagnostic', formData, { reportProgress: true, observe: 'events' });
  }

  getCustomerReports(userID) {
    return this.http.get(this.baseUrl + 'api/reports/get-user-files/' + userID );
  }

  // DownloadFile(fileName: string, fileType:string): Observable<any>{
  //   let fileExtension = fileType;
  //   let input = fileName;
  //   return this.http.post(this.baseUrl + 'api/reports/download-file/'+ fileName,
  //   { responseType: ResponseContentType.Blob })
  //   .pipe(map(
  //     (res) => {
  //           var blob = new Blob([res.blob()], {type: fileExtension} )
  //           return blob;            
  //     }));
  // }

  download(fileName: string, userID): any {
    this.http.get(this.baseUrl + 'api/reports/download-file/' + userID + '/' , { responseType: 'blob'});
  }
}
