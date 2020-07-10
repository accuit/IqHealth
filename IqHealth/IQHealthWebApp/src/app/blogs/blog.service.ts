import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { BlogMaster } from './blog.model';

@Injectable()
export class BlogService {

  baseUrl = environment.apiUrl;
  headers: HttpHeaders;
  constructor(private readonly httpClient: HttpClient) {
    this.headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'No-Auth': 'true'
    });
  }

  getBlogs() {
    return this.httpClient.get(this.baseUrl + 'api/get-blogs', { headers: this.headers });
  }

}