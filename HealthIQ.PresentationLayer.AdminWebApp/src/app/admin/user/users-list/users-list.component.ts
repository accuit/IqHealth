import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';

@Component({
  selector: 'app-users-list',
  templateUrl: './users-list.component.html',
  styleUrls: ['./users-list.component.css']
})
export class UsersListComponent implements OnInit {

  constructor(private readonly service: UserService) { }

  columns: Array<string>;
  students: Array<UserMaster>;
  ngOnInit(): void {
    this.service.getUsers().subscribe(res => {
      this.students = res;
      this.columns = ['ID', 'First Name', 'Last Name', 'Email Address', 'Mobile No.'];
    })
  }

}
