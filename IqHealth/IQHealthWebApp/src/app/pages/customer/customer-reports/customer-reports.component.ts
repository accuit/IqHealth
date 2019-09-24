import { Component, OnInit, Input } from '@angular/core';
import { PagesService } from '../../pages.service';
import { UploadedReports } from '../../shared/model/uploaded-reports';
import { APIResponse } from 'src/app/core/app.models';

@Component({
  selector: 'app-customer-reports',
  templateUrl: './customer-reports.component.html',
  styleUrls: ['./customer-reports.component.scss']
})
export class CustomerReportsComponent implements OnInit {

  reports: UploadedReports[] = [];
  isLoaded = false;

  @Input('userID') userID: string;
  @Input('userType') userType: string;
  constructor(

    private readonly service: PagesService) {

  }

  ngOnInit() {
    this.getUserReports(this.userID, 2);
  }

  getUserReports(userID, companyID) {
    this.service.getCustomerReports(userID, companyID)
      .subscribe((res: APIResponse) => {
        if (res.IsSuccess) {
          this.reports = res.SingleResult;
          this.isLoaded = true;
        }
      })
  }

}
