import { Component, OnInit, AfterViewInit } from '@angular/core';
import { AuthService } from '../core/auth/auth.service';
import { UserMaster, RoleMaster } from '../shared/components/user/user.model';
declare const $: any;

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html'
})
export class DashboardComponent implements OnInit {

  user: UserMaster;
  isAdmin: boolean;
  isStudent: boolean;

  constructor(public authService: AuthService) { };

  ngOnInit(): void {
    this.user = this.authService.currentUser;
    this.isAdmin = this.user.roles.some(x => x === 'Admin');
    this.isStudent = !this.isAdmin && this.user.roles.some(x => x === 'Student');
  }

}
