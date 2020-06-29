import { Injectable, TemplateRef, Type } from '@angular/core';
import { BsModalService, ModalOptions } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { Observable, Subject } from 'rxjs';
import { finalize, last, take } from 'rxjs/operators';

@Injectable()
export class IpxModalService {
    modalRef: BsModalRef;
    fromNotificationService: boolean;
    private readonly cancelOrEscape$: Subject<string>;
    constructor(private readonly bsModalService: BsModalService) {
        this.fromNotificationService = false;
        this.cancelOrEscape$ = new Subject<string>();
    }

    openModal = (content: string | TemplateRef<any> | Type<any>, config?: ModalOptions, notificationService = false): BsModalRef => {
        this.fromNotificationService = notificationService;
        this.bsModalService.onShow.subscribe(() => {
        });

        this.bsModalService.onHide.pipe(take(1), finalize(() => {
            this.fromNotificationService = false;
            this.modalRef = null;
        })).subscribe((reason: string) => {
            if (reason === 'esc' || reason === 'backdrop-click') {
                this.cancelOrEscape$.next(reason);
            }
        });

        this.modalRef = this.bsModalService.show(content, config);

        return this.modalRef;
    };

    onHide = (): Observable<string> => {
        return this.cancelOrEscape$.asObservable();
    };

    closeModal(): void {
        this.modalRef.hide();
    }
}