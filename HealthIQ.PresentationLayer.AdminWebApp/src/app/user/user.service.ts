import { Injectable, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { BehaviorSubject, Observable } from 'rxjs';
import swal, { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { UserMaster } from './user.model';

@Injectable()
export class UserService {

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
  
    getUserProfile(): Observable<any> {
        const isAuth = localStorage.getItem("isAuthorized") === 'true' ? true : false;
        if (isAuth) {
            const id = localStorage.getItem("userID");
            return this.httpClient.get(this.baseUrl + 'account/get-user-profile/'+ +id, { headers: this.headers });
        }
        return null;
    }





}