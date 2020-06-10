import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
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
