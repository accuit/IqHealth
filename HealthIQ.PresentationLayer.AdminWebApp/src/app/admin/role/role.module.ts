import { NgModule } from '@angular/core';
import { RolesListComponent } from './roles-list/roles-list.component';
import { CreateRoleComponent } from './create-role/create-role.component';
import { RoleFormComponent } from './shared/role-form/role-form.component';
import { BaseCommonModule } from '../../../app/shared/base.common.module';



@NgModule({
  declarations: [RolesListComponent, CreateRoleComponent, RoleFormComponent],
  imports: [
    BaseCommonModule
  ]
})
export class RoleModule { }
