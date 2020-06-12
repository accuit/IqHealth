import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminRoutes } from './admin.routing';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(AdminRoutes),
  ]
})
export class AdminModule { }
