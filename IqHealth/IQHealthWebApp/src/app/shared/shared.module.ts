import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FindDoctorComponent } from './components/find-doctor/find-doctor.component';
import { InnerBannerComponent } from './components/inner-banner/inner-banner.component';



@NgModule({
  declarations: [FindDoctorComponent, InnerBannerComponent],
  imports: [
    CommonModule
  ],
  exports: [
    FindDoctorComponent,
    InnerBannerComponent
  ],
  entryComponents:[
    InnerBannerComponent
  ]
})
export class SharedModule { }
