import { Component, OnInit,ViewChild } from '@angular/core';
import { UserService } from '../user.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { DialogBodyComponent } from 'src/app/dialog-body/dialog-body.component';
import { MatTableDataSource } from '@angular/material/table';
import {MatSort} from '@angular/material/sort';
import {MatPaginator} from '@angular/material/paginator';
import {DataSource} from '@angular/cdk/collections';
import {Observable} from 'rxjs/Observable';
import 'rxjs/add/observable/of';
import { Router } from '@angular/router';

@Component({
  selector: 'app-users-list',
  templateUrl: './users-list.component.html',
  styleUrls: ['./users-list.component.css']
})
export class UsersListComponent implements OnInit {

  constructor(private readonly service: UserService,
              public dialog: MatDialog,   
              private router: Router) {
              }
  columns: Array<string>;
  students: Array<UserMaster>;
  selectedrow : UserMaster;

  ngOnInit(): void {

    this.service.getStudents().subscribe(res => {
      this.students = res;
      console.log(this.students.filter(x=>x.isDeleted == false));
      this.columns = ['ID', 'First Name', 'Last Name', 'Email Address', 'Mobile No.','Action'];
    }) 
  }
  openDialog(row: UserMaster)
  {
    const dialogConfig = new MatDialogConfig();
     dialogConfig.disableClose = true;
    dialogConfig.data = row;
    let dialogRef = this.dialog.open(DialogBodyComponent,dialogConfig);
  }

  // delete the user data
  deleteuser(Selectedrow :UserMaster)
  { 
    Selectedrow.isDeleted = true;
    Selectedrow.isEmployee = false;
    this.service.addUpdateUser(Selectedrow);
    this.router.navigate(['user/users-list']);

  }

}

