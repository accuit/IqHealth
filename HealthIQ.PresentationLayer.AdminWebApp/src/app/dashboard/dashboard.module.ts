import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard.component';
import { BaseCommonModule } from '../shared/base.common.module';

export const DashboardRoutes: Routes = [
    {
        path: '',
        children: [{
            path: 'dashboard',
            component: DashboardComponent
        }]
    }
];

@NgModule({
    imports: [
        BaseCommonModule,
        RouterModule.forChild(DashboardRoutes)
    ],
    declarations: [DashboardComponent]
})

export class DashboardModule { }
