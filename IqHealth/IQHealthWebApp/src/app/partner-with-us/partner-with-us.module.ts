import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HealthcareUnitComponent } from './healthcare-unit/healthcare-unit.component';
import { CorporateTieUpComponent } from './corporate-tie-up/corporate-tie-up.component';
import { OrganizeCampComponent } from './organize-camp/organize-camp.component';
import { PartnerWithUsComponent } from './partner-with-us.component';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [PartnerWithUsComponent , HealthcareUnitComponent, CorporateTieUpComponent, OrganizeCampComponent],
  imports: [
    CommonModule,
    SharedModule
  ]
})
export class PartnerWithUsModule { }
