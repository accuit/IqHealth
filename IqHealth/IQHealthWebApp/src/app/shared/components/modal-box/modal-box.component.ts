import { Component, Input, ElementRef, Renderer2, AfterViewInit, ViewChild, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { APIResponse } from 'src/app/core/app.models';
import { AppService } from 'src/app/core/app.service';

@Component({
  selector: 'app-modal-box',
  templateUrl: './modal-box.component.html',
  styleUrls: ['./modal-box.component.scss']
})
export class ModalBoxComponent implements OnInit, AfterViewInit {

  @Input('modal-id') Id: string;
  applicationForm: FormGroup;
  @ViewChild('modal', { static: true }) modal: ElementRef;
  submitted: boolean;
  allTimings: any;
  jsonService: any;
  showSpinner: boolean;
  status: string;
  message: any;

  constructor(private readonly appService: AppService, private formBuilder: FormBuilder, private readonly renderer: Renderer2) { }

  ngAfterViewInit() {
    this.renderer.setAttribute(this.modal.nativeElement, 'id', this.Id);
  }

  loadForm(): any {
    return this.formBuilder.group({
      firstName: ['', [Validators.required, Validators.maxLength(50)]],
      lastName: ['', [Validators.required, Validators.maxLength(50)]],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
      address: ['', [Validators.required, Validators.maxLength(500)]],
      city: ['', Validators.required],
      state: ['', Validators.required],
      zipCode: ['', Validators.required],
      resumeText: ['', Validators.required],
      companyID: [2]
    });

  }

  reset(): void {
    this.submitted = false;
    this.applicationForm.reset();
  }

  ngOnInit() {
    // this.allTimings = this.jsonService.getTimings();
    this.applicationForm = this.loadForm();
  }

  get f() {
    return this.applicationForm.controls;
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.applicationForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.appService.submitJobApplication(this.applicationForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.IsSuccess) {
          this.status = "Success";
          this.message = res.Message;
          // this.appService.sendEmailNotification('api/notification/email-appointment', this.applicationForm.value);
          this.reset();
          
        } else {
          this.status = "Fail";
          this.message = res.Message;
          return;
        }
      },
        err => {
          this.status = "Fail";
          this.message = 'An error occured. Try again later.'
          this.appService.handleError(err);
        });
  }

}
