import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { CityModel, BookingMaster, Doctor, APIResponse, DoctorAppointment } from './app-model';
import { Observable, throwError, pipe, interval, of } from 'rxjs';
import { catchError, map, retryWhen, flatMap } from 'rxjs/operators';
import { environment } from './../environments/environment';

@Injectable()
export class AppService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;

  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*'
    });
  }

  getAllCities(): CityModel[] {

    const cities: CityModel[] = [
      { id: 1, Name: 'Asansol' },
      { id: 2, Name: 'Durgapur' },
      { id: 3, Name: 'Howrah' },
      { id: 4, Name: 'Darjeeling' },
      { id: 5, Name: 'Haldia' },
      { id: 6, Name: 'Kalimpong' },
      { id: 7, Name: 'Kolkata' }
    ]

    return cities;
  }

  getAllDoctors(): any {
    return this.httpClient.get<Doctor[]>(this.baseUrl + 'api/doctors/data');
  }

  getAllServices(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/data');
  }

  getAllTests(): any {
    return this.httpClient.get(this.baseUrl + 'api/services/all-tests');
  }

  getAllPackages(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/all-packages');
  }

  getPackages(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/packages');
  }

  getSpecialities(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/doctors/specialities');
  }

  getDoctorsBySpeciality(id: number): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/doctors/doctors-by-speciality/' + id.toString());
  }


  submitBooking(booking: BookingMaster): any {
    return this.httpClient.post(this.baseUrl + 'api/bookings/add', booking, { headers: this.headers });
  }

  submitDoctorAppointment(appointment: DoctorAppointment): any {
    return this.httpClient.post(this.baseUrl + 'api/bookings/new-appointment', appointment, { headers: this.headers })

  }

  public sendEmailNotification(url: string, params: any): any {
    this.httpClient.post(this.baseUrl + url, params, { headers: this.headers })
      .subscribe((res: APIResponse) => {
        if (res.IsSuccess)
          console.log('Email successfully sent.');
      },
        err => {
          this.handleError(err);
        })
  }

  public handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      // A client-side or network error occurred. Handle it accordingly.
      console.error('An error occurred:', error.error.message);
    } else {
      // The backend returned an unsuccessful response code.
      // The response body may contain clues as to what went wrong,
      console.error(
        `Backend returned code ${error.status}, ` +
        `body was: ${error.error}`);
    }
    alert('Something went wrong!');
    // return an observable with a user-facing error message
    return throwError(
      'Something bad happened; please try again later.');
  };


}
