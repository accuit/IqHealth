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
  downloadUrl = 'http://localhost:65114/api/reports/getFile/';

  @Input('userID') userID: string;
  @Input('userType') userType: string;

  constructor(
    private readonly service: PagesService) {
  }

  ngOnInit() {
    this.getUserReports(this.userID);
  }

  downLoadReport(name){
    this.service.download(name, this.userID).subscribe(res => {
      window.open(window.URL.createObjectURL(res));
    });
  }


  getUserReports(userID) {
    this.service.getCustomerReports(userID)
      .subscribe((res: APIResponse) => {
        if (res.isSuccess) {
          this.reports = res.singleResult;
          this.isLoaded = true;
        }
      })
  }

}
