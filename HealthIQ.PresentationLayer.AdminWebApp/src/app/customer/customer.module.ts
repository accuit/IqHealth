import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReportsListComponent } from './reports-list/reports-list.component';
import { ProfileComponent } from './profile/profile.component';



@NgModule({
  declarations: [ReportsListComponent, ProfileComponent],
  imports: [
    CommonModule
  ]
})
export class CustomerModule { }
