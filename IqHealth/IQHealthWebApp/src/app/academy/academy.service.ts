
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { throwError } from 'rxjs';
import { environment } from '../../environments/environment';
import { CourseMaster } from './academy.model';
import { APIResponse } from '../core/app.models';

@Injectable()
export class AcademyService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;

  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*'
    });
  }

  getMasterCourses(): any {
    return this.httpClient.get(this.baseUrl + 'api/courses/data');
  }

  getCourseDetails(id): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/courses/get-course-details/'+ id);
  }

  getSubCourses(): any {
    return this.httpClient.get(this.baseUrl + 'api/courses/get-sub-courses');
  }


}