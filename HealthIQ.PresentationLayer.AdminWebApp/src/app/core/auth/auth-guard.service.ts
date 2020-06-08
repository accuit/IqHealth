import { Injectable } from '@angular/core';
import { Router, CanActivate, CanActivateChild, CanLoad } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate, CanActivateChild, CanLoad {
  constructor(public auth: AuthService, public router: Router) { }

  canActivateChild(childRoute: import("@angular/router").ActivatedRouteSnapshot, state: import("@angular/router").RouterStateSnapshot): boolean | import("@angular/router").UrlTree | import("rxjs").Observable<boolean | import("@angular/router").UrlTree> | Promise<boolean | import("@angular/router").UrlTree> {
    return this.isAuthenticate();
  }

  canLoad(route: import("@angular/router").Route, segments: import("@angular/router").UrlSegment[]): boolean | import("rxjs").Observable<boolean> | Promise<boolean> {
    return this.isAuthenticate();
  }
  
  canActivate(): boolean {
    return this.isAuthenticate();
  }

  private isAuthenticate(): boolean {
    if (!this.auth.isAuthenticated()) {
      this.router.navigate(['account/login']);
      return false;
    }
    return true;
  }
}