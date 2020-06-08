import { Injectable } from '@angular/core';
import {
    Router,
    CanActivate,
    ActivatedRouteSnapshot
} from '@angular/router';
import decode from 'jwt-decode';
import { AuthService } from './auth.service';

@Injectable({
    providedIn: 'root'
  })
export class RoleGuardService implements CanActivate {
    constructor(public auth: AuthService, public router: Router) { }
    canActivate(route: ActivatedRouteSnapshot): boolean {
        // this will be passed from the route config
        // on the data property
        const expectedRole = route.data.expectedRole;
        const token = localStorage.getItem('token');
        // decode the token to get its payload
        const tokenPayload = decode(token);
        if (
            !this.auth.isAuthenticated() ||
            tokenPayload.role !== expectedRole
        ) {
            this.router.navigate(['account/login']);
            return false;
        }
        return true;
    }
}