import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpUserEvent, HttpEvent } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';


@Injectable()
export class AuthInterceptor implements HttpInterceptor {

    data: any = [];
    constructor(private readonly router: Router) { }

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

        if (req.headers.get('No-Auth') == "True")
            return next.handle(req.clone());

        if (localStorage.getItem('userID') != null) {
            const clonedreq = req.clone({
                headers: req.headers
                .set("UserID", this.getFromLocal('userID'))
                .set("UserType", this.getFromLocal('userType'))
            });
            return next.handle(clonedreq)
        }
        else
            this.router.navigate(['/user-login']);

    }

    getFromLocal(key): any {
        this.data[key] = localStorage.getItem(key);
        return this.data[key];
    }
}


