import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { RegisterComponent } from './register/register.component';
import { LockComponent } from './lock/lock.component';
import { LoginComponent } from './login/login.component';
import { AccountRoutes } from './account.routing';
import { AccountService } from './account.service';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { SharedModule } from '../shared/shared.module';
import { BaseCommonModule } from '../shared/base.common.module';

@NgModule({
  imports: [
    BaseCommonModule,
    RouterModule.forChild(AccountRoutes),
    SharedModule
  ],
  declarations: [
    LoginComponent,
    RegisterComponent,
    LockComponent,
    ResetPasswordComponent
  ],
  providers: [AccountService]
})

export class AccountModule { }
