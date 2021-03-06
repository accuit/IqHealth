import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { CityModel, BookingMaster, Doctor, APIResponse, DoctorAppointment, JobApplication } from './app.models';
import { throwError, Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable()
export class AppService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;

  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'True'
    });
  }

  getAllCities(): CityModel[] {

    const cities: CityModel[] = [
      { id: 1, name: 'Asansol' },
      { id: 2, name: 'Durgapur' },
      { id: 3, name: 'Howrah' },
      { id: 4, name: 'Darjeeling' },
      { id: 5, name: 'Haldia' },
      { id: 6, name: 'Kalimpong' },
      { id: 7, name: 'Kolkata' }
    ]

    return cities;
  }

  getAllDesignation(): any {

    const designations = [
      { id: 1, name: 'Manager' },
      { id: 2, name: 'HR' },
      { id: 3, name: 'Associate' },
      { id: 4, name: 'CEO' },
      { id: 5, name: 'CTO' },
      { id: 6, name: 'Facility Manager' },
      { id: 7, name: 'Assitant Vice President (AVP)' },
      { id: 8, name: 'Vice President (VP)' }
    ]

    return designations;
  }

  getAllDoctors(): any {
    return this.httpClient.get<Doctor[]>(this.baseUrl + 'api/doctors/data/2', { headers: this.headers });
  }

  getAllServices(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/data/2', { headers: this.headers });
  }

  getServiceByID(id): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/service-details/' + id, { headers: this.headers });
  }

  getAllTests(): any {
    return this.httpClient.get(this.baseUrl + 'api/services/all-tests', { headers: this.headers });
  }

  getAllPackageCategories(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/all-package-categories', { headers: this.headers });
  }

  getPackagesByCategory(id): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/packages-by-category/' + id, { headers: this.headers });
  }
  getAllPackages(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/all-packages', { headers: this.headers });
  }

  getPackages(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/services/packages', { headers: this.headers });
  }

  getSpecialities(): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/doctors/specialities', { headers: this.headers });
  }

  getDoctorsBySpeciality(id: number): any {
    return this.httpClient.get<APIResponse>(this.baseUrl + 'api/doctors/doctors-by-speciality/' + id.toString(), { headers: this.headers });
  }


  submitBooking(booking: BookingMaster): any {
    return this.httpClient.post(this.baseUrl + 'api/bookings/add', booking, { headers: this.headers });
  }

  submitDoctorAppointment(appointment: DoctorAppointment): any {
    return this.httpClient.post(this.baseUrl + 'api/bookings/new-appointment', appointment, { headers: this.headers })
  }

  submitContactUsForm(enquiry: any): any {
    return this.httpClient.post(this.baseUrl + 'api/enquiry/contact-us-enquiry', enquiry, { headers: this.headers })
  }

  submitJobApplication(application: JobApplication): any {
    return this.httpClient.post(this.baseUrl + 'api/enquiry/post-job', application, { headers: this.headers })
  }

  uploadResume(files: File[], companyID: string, applicationID): void {
    const formData: FormData = new FormData();
    Array.from(files).forEach(f => formData.append('file', f))

    formData.append('companyID', companyID);
    formData.append('applicationID', applicationID);
    this.httpClient.post(this.baseUrl + 'api/enquiry/upload-cv', formData, { reportProgress: true, observe: 'events' })
      .subscribe(x => {
        console.log(x);
      })
  }

  public sendEmailNotification(url: string, params: any): any {
    url = '' ? 'send-email' : url;
    this.httpClient.post(this.baseUrl + 'api/notification/' + url, params, { headers: this.headers })
      .subscribe((res: APIResponse) => {
        if (res.isSuccess)
          console.log('email successfully sent.');
        else
          console.log(res.message);
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
