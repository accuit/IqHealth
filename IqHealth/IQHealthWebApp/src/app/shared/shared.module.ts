import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FindDoctorComponent } from './components/find-doctor/find-doctor.component';
import { InnerBannerComponent } from './components/inner-banner/inner-banner.component';
import { SidebarListComponent } from './components/sidebar-list/sidebar-list.component';
import { PriceListsComponent } from './components/price-lists/price-lists.component';
import { RouterModule } from '@angular/router';
import { SidebarBlogsComponent } from './components/sidebar-blogs/sidebar-blogs.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DefaultHeaderComponent } from './components/default-header/default-header.component';
import { TopHeaderComponent } from './components/top-header/top-header.component';
import { ModalBoxComponent } from './components/modal-box/modal-box.component';

@NgModule({
  declarations: [
    FindDoctorComponent,
    InnerBannerComponent,
    SidebarListComponent,
    PriceListsComponent,
    SidebarBlogsComponent,
    DefaultHeaderComponent,
    TopHeaderComponent,
    ModalBoxComponent
  ],

  imports: [
    FormsModule,
    ReactiveFormsModule,
    RouterModule,
    CommonModule
  ],

  exports: [
    FindDoctorComponent,
    InnerBannerComponent,
    SidebarListComponent,
    PriceListsComponent,
    SidebarBlogsComponent,
    DefaultHeaderComponent,
    TopHeaderComponent,
    ModalBoxComponent
  ],

  entryComponents: [
    InnerBannerComponent
  ]
})
export class SharedModule { }
