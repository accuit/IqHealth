import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  constructor(private readonly http: HttpClient) { }
  user: User;
  ngOnInit() {
  }

  feedbackForm = new FormGroup({
    name: new FormControl('', [Validators.required,
    Validators.minLength(4)]),
    phone: new FormControl(''),
    email: new FormControl('', [
      Validators.required,
      Validators.pattern("[^ @]*@[^ @]*")
    ])
  });

  onSubmit() {

    const form: any = this.feedbackForm.value;
    const username = form.email;
    const password = form.phone;

    this.http.post('https://localhost:44344/api/user/login', { username, password }
    )
      .subscribe((res: any) => {
        if (res)
          this.user = res;
      })
  }

}

interface User {
  username: string;
  password: string;
  firstName: string;
  LastName: string;
  Email: String;
}
