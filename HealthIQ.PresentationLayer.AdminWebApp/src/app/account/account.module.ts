import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModule } from '../app.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RegisterComponent } from './register/register.component';
import { LockComponent } from './lock/lock.component';
import { LoginComponent } from './login/login.component';
import { AccountRoutes } from './account.routing';
import { AccountService } from './account.service';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AccountRoutes),
    FormsModule,
    MaterialModule,
    ReactiveFormsModule,
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

export class AccountModule {}
