import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FindDoctorComponent } from './components/find-doctor/find-doctor.component';
import { InnerBannerComponent } from './components/inner-banner/inner-banner.component';
import { SidebarListComponent } from './components/sidebar-list/sidebar-list.component';
import { PriceListsComponent } from './components/price-lists/price-lists.component';
import { RouterModule } from '@angular/router';
import { SidebarBlogsComponent } from './components/sidebar-blogs/sidebar-blogs.component';

@NgModule({
  declarations: [
    FindDoctorComponent,
    InnerBannerComponent,
    SidebarListComponent,
    PriceListsComponent,
    SidebarBlogsComponent],

  imports: [
    RouterModule,
    CommonModule
  ],

  exports: [
    FindDoctorComponent,
    InnerBannerComponent,
    SidebarListComponent,
    PriceListsComponent,
    SidebarBlogsComponent
  ],
  
  entryComponents: [
    InnerBannerComponent
  ]
})
export class SharedModule { }
