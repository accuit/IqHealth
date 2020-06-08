import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { UserMaster } from '../shared/components/user/user.model';

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
    return this.httpClient.post(this.baseUrl + 'account/user-login', user, { headers: this.headers });
  }

  registerUser(user: UserMaster): any {
    return this.httpClient.post(this.baseUrl + 'account/register', user, { headers: this.headers });
  }

  resetPassword(user: UserMaster): any {
    return this.httpClient.post(this.baseUrl + 'account/reset-password', user, { headers: this.headers });
  }

  getUsersByType(type): any {
    return this.httpClient.get<UserMaster[]>(this.baseUrl + 'account/get-user-by-status/' + type, { headers: this.headers });
  }

  forgetPassword(email: any) {
    const data = {
      email: email.userEmail,
      password: '123456'
    }
    return this.httpClient.post(this.baseUrl + 'account/forget-password/', data, { headers: this.headers });
  }

  ValidateGUID(GUID: string) {
    return this.httpClient.get(this.baseUrl + 'account/validate-reset-url/' + GUID, { headers: this.headers });
  }



}