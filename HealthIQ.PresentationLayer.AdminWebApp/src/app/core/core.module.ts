import { NgModule } from '@angular/core';
import { JwtModule } from '@auth0/angular-jwt';
import { AlertService } from '../services/alert.service';
import { BaseCommonModule } from '../shared/base.common.module';


@NgModule({
    imports: [
        BaseCommonModule
    ],
    declarations: [],
    providers: [AlertService]
})

export class CoreModule {}
