import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from './auth/auth.service';
import { AuthGuardService } from './auth/auth-guard.service';
import { JwtModule } from '@auth0/angular-jwt';
import { AlertService } from '../services/alert.service';


@NgModule({
    imports: [
        CommonModule
    ],
    declarations: [],
    providers: [AlertService]
})

export class CoreModule {}
