import { NgModule } from '@angular/core';
import { ReportsListComponent } from './reports-list/reports-list.component';
import { ProfileComponent } from './profile/profile.component';
import { BaseCommonModule } from '../shared/base.common.module';



@NgModule({
  declarations: [ReportsListComponent, ProfileComponent],
  imports: [
    BaseCommonModule
  ]
})
export class CustomerModule { }
