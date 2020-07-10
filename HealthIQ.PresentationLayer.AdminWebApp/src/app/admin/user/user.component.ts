import { Component, OnInit } from '@angular/core';
import { UserService } from './user.service';
import { FormBuilder } from '@angular/forms';
import { PrintService } from 'src/app/shared/print/print.service';
import { APIResponse } from 'src/app/core/models';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html'
})
export class UserComponent implements OnInit  {

  user: any;
  constructor(private readonly service: UserService,
    private readonly formBuilder: FormBuilder,
    private readonly print: PrintService) {
  }

  ngOnInit(): void {
    this.service.getUserData().subscribe((user: APIResponse) => {
      this.user = user.singleResult;
    });
  }

}
