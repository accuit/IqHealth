import { Routes } from '@angular/router';

import { DashboardComponent } from './dashboard.component';
import { AuthGuard } from '../core/auth/auth-guard';

export const DashboardRoutes: Routes = [
    {
      path: '',
      canActivate: [AuthGuard],
      children: [ {
        path: 'dashboard',
        component: DashboardComponent
    }]
}
];
