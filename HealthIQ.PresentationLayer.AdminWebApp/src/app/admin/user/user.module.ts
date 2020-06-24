import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsersListComponent } from './users-list/users-list.component';
import { CreateUserComponent } from './create-user/create-user.component';
import { UserFormComponent } from './shared/user-form/user-form.component';
import { UserComponent } from './user.component';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/core/auth/auth-guard';
import { UserService } from './user.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NouisliderModule } from 'ng2-nouislider';
import { TagInputModule } from 'ngx-chips';
import { MaterialModule } from 'src/app/app.module';
import { SharedModule } from '../../../app/shared/shared.module';

export const UserRoutes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    children: [
      {
        path: '',
        component: UserComponent
      },
      {
        path: 'users-list',
        component: UsersListComponent
      },
      {
        path: 'create-user',
        component: CreateUserComponent
      }
    ]
  }
];

@NgModule({
  declarations: [UsersListComponent, CreateUserComponent, UserFormComponent, UserComponent],
  imports: [
    CommonModule,
    RouterModule.forChild(UserRoutes),
    FormsModule,
    ReactiveFormsModule,
    NouisliderModule,
    TagInputModule,
    MaterialModule,
    SharedModule
  ],
  providers: [UserService]
})
export class UserModule { }
