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
import { AuthService } from 'src/app/core/auth/auth.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  baseUrl = environment.apiUrl;
  headers: HttpHeaders;
  userId: number;
  constructor(private readonly httpClient: HttpClient,
    private readonly alert: AlertService,
    private readonly auth: AuthService) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*'
    });

    this.userId = this.auth.currentUser.userID;
  }

  getStudents(): Observable<any> {
    return this.httpClient.get(this.baseUrl + 'student/get/', { headers: this.headers })
      .pipe(map((res: APIResponse) => {
        let list = null;
        if (res.isSuccess) {
          list = res.singleResult;
        } else {
          this.alert.showAlert({ alertType: AlertTypeEnum.error, title: "Failure!", text: res.message });
        }
        return list;
      }));
  }


  addUpdateUser(user: UserMaster): Observable<any> {
    user.createdBy = this.userId;
    return this.httpClient.post(this.baseUrl + 'student/add-student/', user, { headers: this.headers });
  }
}
