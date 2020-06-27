import { NgModule } from '@angular/core';
import { FixedpluginComponent } from './fixedplugin.component';
import { BaseCommonModule } from '../../base.common.module';

@NgModule({
  imports: [
    BaseCommonModule
  ],
  declarations: [FixedpluginComponent],
  exports: [FixedpluginComponent]
})
export class FixedpluginModule { }
