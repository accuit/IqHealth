import { Component, OnInit, AfterViewInit } from '@angular/core';
import PerfectScrollbar from 'perfect-scrollbar';
import { RouteInfo } from '../core/routes';
import { AuthService } from '../core/auth/auth.service';

declare const $: any;

//Menu Items
export const ROUTES: RouteInfo[] = [{
    path: '/dashboard',
    title: 'Dashboard',
    type: 'link',
    icontype: 'dashboard'
},
{
    path: '/user',
    title: 'Maintain Student',
    type: 'sub',
    icontype: 'image',
    collapse: 'user',
    children: [
        {path: 'users-list', title: 'Students List', ab:'S'},
        {path: 'create-user', title: 'Create Student', ab:'TP'}
    ]
},
{
    path: '/invoice',
    title: 'Invoice Manager',
    type: 'sub',
    icontype: 'image',
    collapse: 'invoice',
    children: [
        {path: 'invoices-list', title: 'All invoices', ab:'AI'},
        {path: 'create-invoice', title: 'Generate Invoice', ab:'GI'}
    ]
}
];
@Component({
    selector: 'app-sidebar-cmp',
    templateUrl: 'sidebar.component.html',
})

export class SidebarComponent implements OnInit {
    public menuItems: any[];
    ps: any;
    user: any;

    constructor(public authService: AuthService) { };

    isMobileMenu() {
        if ($(window).width() > 991) {
            return false;
        }
        return true;
    };

    ngOnInit() {
        this.user = this.authService.currentUser;
        this.menuItems = ROUTES.filter(menuItem => menuItem);
        if (window.matchMedia(`(min-width: 960px)`).matches && !this.isMac()) {
            const elemSidebar = <HTMLElement>document.querySelector('.sidebar .sidebar-wrapper');
            this.ps = new PerfectScrollbar(elemSidebar);
        }
    }

    updatePS(): void {
        if (window.matchMedia(`(min-width: 960px)`).matches && !this.isMac()) {
            this.ps.update();
        }
    }
    isMac(): boolean {
        let bool = false;
        if (navigator.platform.toUpperCase().indexOf('MAC') >= 0 || navigator.platform.toUpperCase().indexOf('IPAD') >= 0) {
            bool = true;
        }
        return bool;
    }
}
