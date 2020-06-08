import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RolesListComponent } from './roles-list/roles-list.component';
import { CreateRoleComponent } from './create-role/create-role.component';
import { RoleFormComponent } from './shared/role-form/role-form.component';



@NgModule({
  declarations: [RolesListComponent, CreateRoleComponent, RoleFormComponent],
  imports: [
    CommonModule
  ]
})
export class RoleModule { }
