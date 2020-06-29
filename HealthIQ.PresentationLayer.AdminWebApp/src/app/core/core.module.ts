import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { JwtModule } from '@auth0/angular-jwt';
import { AlertService } from '../services/alert.service';
import { InvoiceService } from '../services/invoice.service';


@NgModule({
    imports: [
        CommonModule
    ],
    declarations: [],
    providers: [AlertService, InvoiceService]
})

export class CoreModule {}
