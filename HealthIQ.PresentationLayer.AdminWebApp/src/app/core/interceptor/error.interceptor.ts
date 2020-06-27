import {
    HttpEvent,
    HttpHandler,
    HttpRequest,
    HttpErrorResponse,
    HttpInterceptor,
    HttpResponse
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry, tap } from 'rxjs/operators';
import { AlertService } from 'src/app/services/alert.service';
import { AlertTypeEnum } from '../enums';
import { Injectable } from '@angular/core';
import { APIResponse } from '../models';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {
    constructor(private readonly alert: AlertService) { }
    intercept(
        request: HttpRequest<any>,
        next: HttpHandler
    ): Observable<HttpEvent<any>> {
        return next.handle(request)
            .pipe(
                tap(evt => {
                    if (evt instanceof HttpResponse) {
                        if (evt.body && evt.status === HttpStatusEnum.Success)
                           {
                               const response: APIResponse = evt.body;
                               if(response.statusCode != HttpStatusEnum.Success.toString()){
                                this.displayServerError(+response.statusCode, response.message);
                               }
                           }                       
                    }
                }),
                retry(1),
                catchError((error: HttpErrorResponse) => {
                    let errorMessage = '';
                    if (error.error instanceof ErrorEvent) {
                        console.log(error);
                        errorMessage = `Error: ${error.error.message}`;
                        this.alert.showAlert({ alertType: AlertTypeEnum.error, title: 'Web Page Error!', text: 'Internal server error. Please contact administrator.' });
                    } else {
                        errorMessage = `Error Status: ${error.status}\nMessage: ${error.message}`;
                        this.displayServerError(error.status, errorMessage);
                    }

                    console.log(errorMessage);
                    return throwError(errorMessage);
                })
            )
    }

    private displayServerError(status: number, message: string): void {
        if (status === HttpStatusEnum.BadRequest) {
            this.alert.showAlert({ alertType: AlertTypeEnum.error, text: 'Something is wrong with request parameters. Please check and try again!' });
        } else if (status === HttpStatusEnum.InternalServerError) {
            this.alert.showAlert({ alertType: AlertTypeEnum.error, text: 'Internal server error. Please contact administrator.' });
        } else if (status === HttpStatusEnum.NotFound) {
            this.alert.showAlert({ alertType: AlertTypeEnum.warning, title: 'Are you lost?', text: 'Page or Content is not found.' });
        } else if (status === HttpStatusEnum.Forbidden || HttpStatusEnum.UnAuthorized) {
            this.alert.showAlert({ alertType: AlertTypeEnum.warning, title: 'UnAuthorized Access!', text: 'You do not have permission to perform this action. Please contact administrator.' })
            
        
        } else {
            this.alert.showAlert({ alertType: AlertTypeEnum.error, title: 'OOPS!', text: 'Something went wrong. Please try again later.' });
        }
    }
}

export enum HttpStatusEnum {
    NotFound = 404,
    InternalServerError = 500,
    Forbidden = 403,
    Success = 200,
    BadRequest = 400,
    UnAuthorized = 401
}