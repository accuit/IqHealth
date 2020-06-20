import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { BehaviorSubject } from 'rxjs';
import swal, { SweetAlertOptions, SweetAlertType } from 'sweetalert2';
import { AlertTypeEnum } from '../core/enums';

export class AlertOptions implements SweetAlertOptions {
    text: string;
    alertType: AlertTypeEnum;
    title?: string;
}

@Injectable()
export class AlertService {

    showAlert(options: AlertOptions) {
        const defaultOptions = {
            allowEscapeKey: false,
            allowOutsideClick: false,
            allowEnterKey: false,
            buttonsStyling: false,
            confirmButtonClass: "btn btn-success",
            cancelButtonClass: 'btn btn-danger'
        };

        const type = options.alertType === AlertTypeEnum.cancelled ? 'error' : (options.alertType === AlertTypeEnum.info ? 'success' : options.alertType);
        const settings: SweetAlertOptions = Object.assign(options, defaultOptions, { type: type as SweetAlertType });

        switch (options.alertType) {
            case AlertTypeEnum.success:
                settings.title = options.title ? options.title : "Success!";
                swal(settings).catch(swal.noop)
                break;
            case AlertTypeEnum.cancelled:
                options.title ? options.title : 'Task Cancelled!'
                swal(settings).catch(swal.noop)
                break;
            case AlertTypeEnum.error:
                options.title ? options.title : 'Error Occured!'
                swal(settings).catch(swal.noop)
                break;
            case AlertTypeEnum.warning:
                options.title ? options.title : 'Warning!'
                swal(settings).catch(swal.noop)
                break;
            case AlertTypeEnum.info:
                options.title ? options.title : 'Information!'
                swal(settings).catch(swal.noop)
                break;
        }

    }

    // showAlert(alert: SweetAlertOptions, type?: any) {
    //     type = type ? type : alert.type;
    //     if (type == AlertTypeEnum.success as SweetAlertType) {
    //         swal(alert).catch(swal.noop)

    //     } else if (type == AlertTypeEnum.fail as SweetAlertType) {
    //         swal({
    //             title: "Login failed",
    //             text: "Incorrect credentials! Please try again.",
    //             buttonsStyling: false,
    //             confirmButtonClass: "btn btn-danger"
    //         }).catch(swal.noop)

    //     } else if (type == AlertTypeEnum.error as SweetAlertType) {
    //         swal({
    //             title: "OOPS!",
    //             text: "OOPS! Something went wrong. Contact administrator.",
    //             buttonsStyling: false,
    //             confirmButtonClass: "btn btn-info"
    //         }).catch(swal.noop)

    //     }
    // }
}
