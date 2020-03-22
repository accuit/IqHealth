import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HealthcareUnitComponent } from './healthcare-unit/healthcare-unit.component';
import { CorporateTieUpComponent } from './corporate-tie-up/corporate-tie-up.component';
import { OrganizeCampComponent } from './organize-camp/organize-camp.component';



@NgModule({
  declarations: [HealthcareUnitComponent, CorporateTieUpComponent, OrganizeCampComponent],
  imports: [
    CommonModule
  ]
})
export class PartnerWithUsModule { }
