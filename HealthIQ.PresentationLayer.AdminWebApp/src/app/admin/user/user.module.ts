import { NgModule } from '@angular/core';
import { UsersListComponent } from './users-list/users-list.component';
import { CreateUserComponent } from './create-user/create-user.component';
import { UserFormComponent } from './shared/user-form/user-form.component';
import { UserComponent } from './user.component';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from 'src/app/core/auth/auth-guard';
import { UserService } from './user.service';
import { BaseCommonModule } from 'src/app/shared/base.common.module';

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
    BaseCommonModule,
    RouterModule.forChild(UserRoutes)
  ],
  providers: [UserService]
})
export class UserModule { }
