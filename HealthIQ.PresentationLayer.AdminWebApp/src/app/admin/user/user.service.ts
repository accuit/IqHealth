import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { map } from 'rxjs/operators';
import { APIResponse } from 'src/app/core/models';
import { Observable } from 'rxjs';
import { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum, AlertTitleEnum } from 'src/app/core/enums';
import { AlertService } from 'src/app/services/alert.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  baseUrl = environment.apiUrl;
  headers: HttpHeaders;
  constructor(private readonly httpClient: HttpClient, private readonly alert: AlertService) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'True'
    });
  }

  getStudents(): Observable<any> {
    return this.httpClient.get(this.baseUrl + 'student/get/', { headers: this.headers })
      .pipe(map((res: APIResponse) => {
        let list = null;
        if (res.isSuccess) {
          list = res.singleResult;
        } else {
          const alert: SweetAlertOptions = {
            type: AlertTypeEnum.error as SweetAlertType,
            title: AlertTitleEnum.Fail,
            text: res.message
          }
          this.alert.showAlert(alert);
        }
        return list;
      }));
  }
}
