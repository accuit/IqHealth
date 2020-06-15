import { Component, OnInit } from '@angular/core';
import { UserMaster } from 'src/app/shared/components/user/user.model';
import { UserService } from '../../user/user.service';

@Component({
  selector: 'app-invoices-list',
  templateUrl: './invoices-list.component.html',
  styleUrls: ['./invoices-list.component.css']
})
export class InvoicesListComponent implements OnInit {

  constructor(private readonly service: UserService) { }

  columns: Array<string>;
  invoices: Array<UserMaster>;
  ngOnInit(): void {
    this.service.getStudents().subscribe(res => {
      this.invoices = res;
      this.columns = ['ID', 'First Name', 'Last Name', 'Email Address', 'Mobile No.'];
    })
  }
}
