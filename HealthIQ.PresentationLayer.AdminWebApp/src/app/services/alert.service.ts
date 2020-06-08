import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { BehaviorSubject } from 'rxjs';
import swal, { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum } from '../core/enums';

@Injectable()
export class AlertService {

  constructor() { }

  showAlert(alert: SweetAlertOptions, type?: any) {
    type = type ? type : alert.type;
    if (type == AlertTypeEnum.success as SweetAlertType) {
        swal(alert).catch(swal.noop)

    } else if (type == AlertTypeEnum.fail as SweetAlertType) {
        swal({
            title: "Login failed",
            text: "Incorrect credentials! Please try again.",
            buttonsStyling: false,
            confirmButtonClass: "btn btn-danger"
        }).catch(swal.noop)

    } else if (type == AlertTypeEnum.error as SweetAlertType) {
        swal({
            title: "OOPS!",
            text: "OOPS! Something went wrong. Contact administrator.",
            buttonsStyling: false,
            confirmButtonClass: "btn btn-info"
        }).catch(swal.noop)

    }
}
}
