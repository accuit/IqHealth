import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsersListComponent } from './users-list/users-list.component';
import { CreateUserComponent } from './create-user/create-user.component';
import { UserFormComponent } from './shared/user-form/user-form.component';
import { UserComponent } from './user.component';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/core/auth/auth-guard';
import { Role } from 'src/app/core/models/role';
import { UserService } from './user.service';

export const UserRoutes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    data: { roles: [Role.Admin] },
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
  ],
  providers: [UserService]
})
export class UserModule { }
