import { Routes } from '@angular/router';
import { AuthGuard } from '../core/auth/auth-guard';
import { Role } from '../core/models/role';
import { DashboardComponent } from '../dashboard/dashboard.component';
import { RoleGuard } from '../core/auth/role-guard';
import { AdminComponent } from './admin.component';

export const AdminRoutes: Routes = [
    {
        path: '',
        component: AdminComponent,
        children: [
            {
                path: 'user',
                loadChildren: './user/user.module#UserModule'
            },
            {
                path: 'invoice',
                loadChildren: './invoice/invoice.module#InvoiceModule'
            }
        ]
    }
];