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
import { APIResponse } from 'src/app/core/models';
import { AlertService } from 'src/app/services/alert.service';
import { AlertTypeEnum } from 'src/app/core/enums';

@Component({
  selector: 'app-users-list',
  templateUrl: './users-list.component.html',
  styleUrls: ['./users-list.component.css']
})
export class UsersListComponent implements OnInit {

  constructor(private readonly service: UserService,
              public dialog: MatDialog,
              private readonly alert: AlertService,
   
              private router: Router) {
              }
  columns: Array<string>;
  students: Array<UserMaster>;
  selectedrow : UserMaster;

  ngOnInit(): void {

    this.service.getUsers().subscribe(res => {
      this.students = res;
  //    console.log(this.students.filter(x=>x.isDeleted == false));
      this.columns = ['ID', 'First Name', 'Last Name', 'Email Address', 'Mobile No.','Action'];
    }) 
  }
  openDialog(row: UserMaster)
  {
    const dialogConfig = new MatDialogConfig();
     dialogConfig.disableClose = true;
    dialogConfig.data = row;
    dialogConfig.width = '60%';

    let dialogRef = this.dialog.open(DialogBodyComponent,dialogConfig);
  }

  // delete the user data
  deleteuser(SelectedrowId)
  { 
    this.service.deleteUser(SelectedrowId)
      .subscribe((res: APIResponse) => {
        if (res) {
          this.alert.showAlert({ alertType: AlertTypeEnum.success, text: 'User deleted successfully' });
          this.ngOnInit();
        }
      });
  }

}

