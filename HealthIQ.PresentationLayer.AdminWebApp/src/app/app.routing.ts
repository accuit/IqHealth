import { Routes } from '@angular/router';
import { AdminLayoutComponent } from './layouts/admin/admin-layout.component';
import { AuthLayoutComponent } from './layouts/auth/auth-layout.component';
import { Role } from './core/models/role';
import { AuthGuard } from './core/auth/auth-guard';

export const AppRoutes: Routes = [
    {
        path: '',
        redirectTo: 'dashboard',
        pathMatch: 'full',
    }, {
        path: '',
        canActivate: [AuthGuard],
        component: AdminLayoutComponent,
        children: [
            {
                path: '',
                loadChildren: './dashboard/dashboard.module#DashboardModule'
            }
            , {
                path: '',
                loadChildren: './admin/admin.module#AdminModule'
            }, {
                path: 'student',
                loadChildren: './student/student.module#StudentModule'
            }
        ]
    }, {
        path: '',
        component: AuthLayoutComponent,
        children: [{
            path: 'account',
            loadChildren: './account/account.module#AccountModule'
        }]
    }
];
