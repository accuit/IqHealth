import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { AlertService } from 'src/app/services/alert.service';

@Injectable()
export class StudentService {
  baseUrl = environment.apiUrl;
  headers: HttpHeaders;
  constructor(private readonly httpClient: HttpClient, private readonly alert: AlertService) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*'
    });
  }

  getStudentData(id: number): any {
    return this.httpClient.get(this.baseUrl + 'student/get-profile/'+ id, { headers: this.headers });
  }
}
