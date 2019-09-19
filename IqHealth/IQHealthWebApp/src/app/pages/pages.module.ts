import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component';
import { PagesService } from './pages.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from '../app-routing.module';
import { UserProfileComponent } from './user-profile/user-profile.component';
import { UploadCustomerReportComponent } from './upload-customer-report/upload-customer-report.component';
import { AccountHeaderComponent } from './shared/account-header/account-header.component';
import { RouterModule } from '@angular/router';
import { CustomerReportsComponent } from './customer/customer-reports/customer-reports.component';

@NgModule({
  declarations: [DashboardComponent, UserProfileComponent, UploadCustomerReportComponent, AccountHeaderComponent, CustomerReportsComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    RouterModule
  ],
  providers: [PagesService],
  exports: [AccountHeaderComponent]
})
export class PagesModule { }
