import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsersListComponent } from './users-list/users-list.component';
import { CreateUserComponent } from './create-user/create-user.component';
import { UserFormComponent } from './shared/user-form/user-form.component';



@NgModule({
  declarations: [UsersListComponent, CreateUserComponent, UserFormComponent],
  imports: [
    CommonModule
  ]
})
export class UserModule { }
