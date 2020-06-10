// https://medium.com/@ryanchenkie_40935/angular-authentication-using-route-guards-bf7a4ca13ae3

import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { BehaviorSubject, Observable } from 'rxjs';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { AlertService } from 'src/app/services/alert.service';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from '../enums';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private userSubject: BehaviorSubject<UserMaster>;
  user: Observable<UserMaster>;
  private isLogged: BehaviorSubject<boolean>;
  isLoggedIn$: Observable<boolean>;

  constructor(
      private router: Router,
      private http: HttpClient,
      private readonly alert: AlertService
  ) {
      this.userSubject = new BehaviorSubject<UserMaster>(JSON.parse(localStorage.getItem('currentUser')));
      this.user = this.userSubject.asObservable();
      this.isLogged = this.userSubject ? new BehaviorSubject<boolean>(true): new BehaviorSubject<boolean>(false);
  }

  public get currentUser(): UserMaster {
      return this.userSubject.value;
  }

  public get isLoggedIn(): boolean {
    return this.isLogged.value;
}

  login(email: string, password: string) {
      return this.http.post<any>(`${environment.apiUrl}/account/user-login`, { email, password })
          .pipe(map(res => {
            let user = null;
              if (res.isSuccess) {
                user = res.singleResult;
                localStorage.setItem('currentUser', JSON.stringify(user));
                this.userSubject.next(user);
                this.isLogged.next(res.isSuccess);
              } else {
                const alert: SweetAlertOptions = {
                  type: AlertTypeEnum.error as SweetAlertType,
                  title: AlertTitleEnum.Fail,
                  text: res.message
              }
              this.alert.showAlert(alert);
              }
              return user;
          }));
  }

  logout() {
      localStorage.removeItem('currentUser');
      this.userSubject.next(null);
      this.isLogged.next(false);
      this.router.navigate(['/account/login']);
  }
}