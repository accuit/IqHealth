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
  roles: Array<RoleMaster>;
  isAdmin: boolean;
  isStudent: boolean;

  constructor(public authService: AuthService) { };

  ngOnInit(): void {
    this.user = this.authService.currentUser;
    this.roles = this.user.userRoles.map(x=>x.roleMaster);
    console.log(this.roles);
    this.isAdmin = this.roles.some(x=>x.name === 'Admin');
    this.isStudent = !this.isAdmin && this.roles.some(x=>x.name === 'Student');
  }

}
