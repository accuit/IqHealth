
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


@Injectable()
export class AppJsonService {
    constructor(private http: HttpClient) {
    }
    public getAllServices(): Observable<any> {
        return this.http.get("/assets/json-data/services-list.json");
    }
}
