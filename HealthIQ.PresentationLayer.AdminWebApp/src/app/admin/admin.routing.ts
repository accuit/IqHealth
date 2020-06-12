import { Routes } from '@angular/router';
import { AuthGuard } from '../core/auth/auth-guard';
import { Role } from '../core/models/role';
import { DashboardComponent } from '../dashboard/dashboard.component';
import { RoleGuard } from '../core/auth/role-guard';

export const AdminRoutes: Routes = [
    {
        path: '',
        //canActivate: [RoleGuard],
        // data: {
        //     roles: [
        //         Role.Admin,
        //     ]
        // },
        children: [
            {
                path: 'user',
                loadChildren: './user/user.module#UserModule'
            }
        ]
    }
];