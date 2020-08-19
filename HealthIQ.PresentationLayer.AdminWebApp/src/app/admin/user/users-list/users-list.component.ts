import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { DialogBodyComponent } from 'src/app/dialog-body/dialog-body.component';

@Component({
  selector: 'app-users-list',
  templateUrl: './users-list.component.html',
  styleUrls: ['./users-list.component.css']
})
export class UsersListComponent implements OnInit {

  constructor(private readonly service: UserService,public dialog: MatDialog){}

  columns: Array<string>;
  students: Array<UserMaster>;
  selectedrow : UserMaster;

  ngOnInit(): void {
    this.service.getStudents().subscribe(res => {
      this.students = res;
      this.columns = ['ID', 'First Name', 'Last Name', 'Email Address', 'Mobile No.','Action'];
    }) 
  }
  openDialog(row: UserMaster)
  {
    debugger;
    const dialogConfig = new MatDialogConfig();
     dialogConfig.disableClose = true;
   // dialogConfig.autoFocus = true;
    dialogConfig.data = row;
    let dialogRef = this.dialog.open(DialogBodyComponent,dialogConfig);
  }

  

}
