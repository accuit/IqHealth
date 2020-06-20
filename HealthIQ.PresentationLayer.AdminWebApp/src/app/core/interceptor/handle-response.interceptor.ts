import { Injectable } from '@angular/core';
import {
    HttpRequest,
    HttpHandler,
    HttpEvent,
    HttpInterceptor,
    HttpResponse
} from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { AuthService } from '../auth/auth.service';
import { tap } from 'rxjs/operators';
import { AlertService } from 'src/app/services/alert.service';
import { AlertTypeEnum } from '../enums';

@Injectable()
export class HandleRespnseInterceptor implements HttpInterceptor {
    constructor(public auth: AuthService, private readonly alertService: AlertService) { }
    intercept(
        req: HttpRequest<any>,
        next: HttpHandler
      ): Observable<HttpEvent<any>> {
    
        return next.handle(req).pipe(
            tap(evt => {
                if (evt instanceof HttpResponse) {
                    if(evt.body && evt.body.success)
                        console.log(evt);
                        this.alertService.showAlert({ alertType: AlertTypeEnum.error, title: "Failure!", text: 'message' });
                }
            }));
      }
}