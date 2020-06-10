import { Injectable } from '@angular/core';
import { Router, CanActivate, CanActivateChild, CanLoad, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(public authService: AuthService, public router: Router) { }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) : boolean {
    const user = this.authService.currentUser;
    if (user) {

      //   if (route.data.roles && route.data.roles.indexOf(user.role) === -1) {
      //       this.router.navigate(['/']);
      //       return false;
      //   }

        return true;
    }
    this.router.navigate(['account/login'], { queryParams: { returnUrl: state.url } });
    return false;
  }
}