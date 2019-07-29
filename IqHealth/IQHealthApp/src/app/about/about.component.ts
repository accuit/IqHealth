import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  feedbackForm = new FormGroup({
    name: new FormControl('',[ Validators.required,
      Validators.minLength(4)]),
    phone: new FormControl(''),
    email: new FormControl('', [
      Validators.required,
      Validators.pattern("[^ @]*@[^ @]*")
    ]),
    messege: new FormControl('')
  });

  onSubmit(){
    console.warn(this.feedbackForm.value);
  }

}
