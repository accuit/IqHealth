import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from './auth/auth.service';
import { AuthGuardService } from './auth/auth-guard.service';
import { JwtModule } from '@auth0/angular-jwt';
import { CoreService } from './core.service';

@NgModule({
    imports: [
        CommonModule
    ],
    declarations: [],
    providers: [CoreService, AuthService, AuthGuardService]
})

export class CoreModule {}
