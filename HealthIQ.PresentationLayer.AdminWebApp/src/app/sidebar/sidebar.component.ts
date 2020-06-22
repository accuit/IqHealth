import { Component, OnInit, AfterViewInit } from '@angular/core';
import PerfectScrollbar from 'perfect-scrollbar';
import { RouteInfo } from '../core/routes';
import { AuthService } from '../core/auth/auth.service';
import { UserMaster } from '../shared/components/user/user.model';

declare const $: any;

//Menu Items
export const ROUTES: RouteInfo[] = [{
    path: '/dashboard',
    title: 'Dashboard',
    type: 'link',
    icontype: 'dashboard',
    roles: ['Admin', 'Employee', 'Student']
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
    ],
    roles: ['Admin', 'Employee']
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
    ],
    roles: ['Admin', 'Employee']
},
{
    path: '/student/courses',
    title: 'Student Courses',
    type: 'link',
    icontype: 'image',
    roles: ['Student']
},
{
    path: '/student/books',
    title: 'Books',
    type: 'link',
    icontype: 'image',
    roles: ['Student']
},
];
@Component({
    selector: 'app-sidebar-cmp',
    templateUrl: 'sidebar.component.html',
})

export class SidebarComponent implements OnInit {
    public menuItems: any[];
    ps: any;
    user: UserMaster;

    constructor(public authService: AuthService) { };

    isMobileMenu() {
        if ($(window).width() > 991) {
            return false;
        }
        return true;
    };

    ngOnInit() {
        this.user = this.authService.currentUser;
        this.menuItems = ROUTES.filter(x=>x.roles.some(r => r === this.user.roles[0]));
        if (window.matchMedia(`(min-width: 960px)`).matches && !this.isMac()) {
            const elemSidebar = <HTMLElement>document.querySelector('.sidebar .sidebar-wrapper');
            this.ps = new PerfectScrollbar(elemSidebar);
        }
    }

    logout = (): void => {
        this.authService.logout();
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
