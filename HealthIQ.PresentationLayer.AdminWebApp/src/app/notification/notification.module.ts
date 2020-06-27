import { NgModule } from '@angular/core';
import { NotificationListComponent } from './notification-list/notification-list.component';
import { BaseCommonModule } from '../shared/base.common.module';



@NgModule({
  declarations: [NotificationListComponent],
  imports: [
    BaseCommonModule
  ]
})
export class NotificationModule { }
