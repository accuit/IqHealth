import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminRoutes } from './admin.routing';
import { RouterModule } from '@angular/router';
import { InvoiceModule } from './invoice/invoice.module';
import { AdminComponent } from './admin.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../app.module';
import { NouisliderModule } from 'ng2-nouislider';
import { TagInputModule } from 'ngx-chips';
import { SharedModule } from '../shared/shared.module';
import { CreateBlogComponent } from './blog/create-blog/create-blog.component';
import { BlogService } from './blog/blog.service';

@NgModule({
  declarations: [AdminComponent, CreateBlogComponent],
  imports: [
    CommonModule,
    RouterModule.forChild(AdminRoutes),
    FormsModule,
    ReactiveFormsModule,
    SharedModule,
    MaterialModule,
    TagInputModule
  ],
  providers: [BlogService]
})
export class AdminModule { }
