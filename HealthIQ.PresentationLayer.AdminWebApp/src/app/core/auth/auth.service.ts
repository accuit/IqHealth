// https://medium.com/@ryanchenkie_40935/angular-authentication-using-route-guards-bf7a4ca13ae3

import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  isAuthorized$ : BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
  authorizedUser$ : BehaviorSubject<any> = new BehaviorSubject<any>(null);

  constructor( ) {}
  
  public isAuthenticated(): boolean {
    const isAuth = localStorage.getItem("isAuthorized") === 'true'? true: false;
    //const isAuth = this.core.isAuthorized$.getValue();
    return isAuth;
    // const token = localStorage.getItem('token');
    //return  !this.jwtHelper.isTokenExpired(token);
  }
}