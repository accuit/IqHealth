// https://medium.com/@ryanchenkie_40935/angular-authentication-using-route-guards-bf7a4ca13ae3

import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { BehaviorSubject, Observable } from 'rxjs';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { AlertService, AlertOptions } from 'src/app/services/alert.service';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from '../enums';
import { EncodeDecodeService } from '../encode-decode.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private user: BehaviorSubject<UserMaster>;
  user$: Observable<UserMaster>;
  private isLogged: BehaviorSubject<boolean>;
  isLoggedIn$: Observable<boolean>;

  private token: BehaviorSubject<string> = new BehaviorSubject<string>('');
  token$: Observable<string>;

  constructor(
    private router: Router,
    private http: HttpClient,
    private readonly alert: AlertService,
    private readonly encode: EncodeDecodeService
  ) {
    this.user = new BehaviorSubject<UserMaster>(JSON.parse(localStorage.getItem('currentUser')));
    this.user$ = this.user.asObservable();
    this.isLogged = this.user ? new BehaviorSubject<boolean>(true) : new BehaviorSubject<boolean>(false);
    this.token = new BehaviorSubject<string>(localStorage.getItem('token'));
    this.token$ = this.token.asObservable();
  }

  get currentUser(): UserMaster {
    return this.user.value;
  }

  get isLoggedIn(): boolean {
    return this.isLogged.value;
  }

  get getToken(): string {
    if (!this.token.value) {
      return localStorage.getItem('token');
    } else {
      return this.token.value;
    }
  }

  login(email: string, password: string) {
    return this.http.post<any>(`${environment.apiUrl}/account/user-login`, { email, password })
      .pipe(map(res => {
        let user : UserMaster = null;
        if (res.isSuccess) {
          user = res.singleResult;
          user.roles = user.userRoles.map(x=> x.roleMaster.name);
          console.log(user);
          localStorage.setItem('currentUser', JSON.stringify(user));
          localStorage.setItem('token', this.encode.b64EncodeUnicode(email + ':' + password));
          this.user.next(user);
          this.isLogged.next(res.isSuccess);
        } else {
          this.alert.showAlert({ alertType: AlertTypeEnum.error, text: res.message });
        }
        return user;
      }));
  }

  logout() {
    localStorage.removeItem('currentUser');
    localStorage.removeItem('token');
    this.user.next(null);
    this.isLogged.next(false);
    this.token.next(null);
    this.router.navigate(['/account/login']);
  }
}