import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { UserMaster } from 'src/app/core/app.models';

@Injectable()
export class AccountService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;

  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'True'
  });
  }


  loginUser(user: UserMaster): any {
    return this.httpClient.post(this.baseUrl + 'api/users/login', user, { headers: this.headers });
  }

  registerUser(user: UserMaster): any {
    return this.httpClient.post(this.baseUrl + 'api/users/register', user, { headers: this.headers });
  }

  resetPassword(user: UserMaster): any {
    return this.httpClient.post(this.baseUrl + 'api/users/reset-password', user, { headers: this.headers });
  }

  getUsersByType(type): any {
    return this.httpClient.get<UserMaster[]>(this.baseUrl + 'api/users/data/'+ type, { headers: this.headers });
  }


}