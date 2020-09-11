import { Injectable, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../../environments/environment';
import { BehaviorSubject, Observable } from 'rxjs';
import swal, { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { UserMaster } from './user.model';
import { AuthService } from 'src/app/core/auth/auth.service';

@Injectable()
export class UserSharedService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;
  userId: number;
  constructor(private readonly httpClient: HttpClient,
    private readonly auth: AuthService) {
    this.userId = this.auth.currentUser.userID;

    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*'
    });
  }

  loginUser(user: UserMaster): any {
    return this.httpClient.post(this.baseUrl + 'account/user-login', user, { headers: this.headers });
  }

  getUserProfile(): Observable<any> {
    const isAuth = this.auth.isLoggedIn;
    if (isAuth) {
      return this.httpClient.get(this.baseUrl + 'get-user-profile/' + this.userId, { headers: this.headers });
    }
    return null;
  }

  getLoggedInUserData(): any {
    return this.httpClient.get(this.baseUrl + 'get-user-profile/' + this.userId, { headers: this.headers });
  }

}