import { Routes } from '@angular/router';

export const AdminRoutes: Routes = [

    {
        path: 'user',
        loadChildren: './user/user.module#UserModule'
    },
    {
        path: 'invoice',
        loadChildren: './invoice/invoice.module#InvoiceModule'
    }


];