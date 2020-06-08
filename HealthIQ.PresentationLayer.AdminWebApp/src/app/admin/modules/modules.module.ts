import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ModulesListComponent } from './modules-list/modules-list.component';
import { CreateModuleComponent } from './create-module/create-module.component';



@NgModule({
  declarations: [ModulesListComponent, CreateModuleComponent],
  imports: [
    CommonModule
  ]
})
export class ModulesModule { }
