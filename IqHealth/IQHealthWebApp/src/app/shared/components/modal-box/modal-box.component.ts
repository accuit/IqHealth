import { Component, Input, ElementRef, Renderer2, AfterViewInit, ViewChild, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { APIResponse } from 'src/app/core/app.models';
import { AppService } from 'src/app/core/app.service';
import { error } from '@angular/compiler/src/util';

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
  files: any;
  isUploading = false;
  message: string = 'Processing...';

  percentDone: number;
  uploadSuccess: boolean;
  isError: boolean;

  constructor(private readonly appService: AppService, private formBuilder: FormBuilder, private readonly renderer: Renderer2) { }

  ngAfterViewInit() {
    this.renderer.setAttribute(this.modal.nativeElement, 'id', this.Id);
    this.message = '';
  }

  loadForm(): any {
    return this.formBuilder.group({
      firstName: ['', [Validators.required, Validators.maxLength(50)]],
      lastName: ['', [Validators.required, Validators.maxLength(50)]],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
      fileName: [""],
      // address: ['', [Validators.required, Validators.maxLength(500)]],
      city: [''],
      // state: ['', Validators.required],
      // zipCode: ['', Validators.required],
      resumeText: [''],
      subject:['Online application for job.'],
      companyID: [2]
    });

  }

  upload(files: File[]) {
    //pick from one of the 4 styles of file uploads below
    this.files = files;
  }

  reset(): void {
    this.submitted = false;
    this.applicationForm.reset();
  }

  ngOnInit() {
    this.applicationForm = this.loadForm();
    this.reset();
  }

  get f() {
    return this.applicationForm.controls;
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.applicationForm.invalid) {
      return;
    }
    if (this.files && this.files[0].type !== 'application/pdf') {
      this.isError = true;
      this.message = 'Please upload only pdf file.';
      return;
    }
    this.showSpinner = true;
    this.applicationForm.patchValue({ companyID: 2, subject: "Online application for job." })
    this.isUploading = true;
    this.appService.submitJobApplication(this.applicationForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.isSuccess && res.singleResult > 0) {
          if (this.files)
            this.appService.uploadResume(this.files, '2', res.singleResult);
          this.status = "Success";
          this.message = res.message;
          this.appService.sendEmailNotification('', this.applicationForm.value);
          setTimeout(() => {
            this.uploadSuccess = true;
          }, 5000);

        } else {
          this.message = res.message;
          this.isError = true;
          return;
        }
        this.reset();
        this.isUploading = false;
        this.isError = false;
      },
        error => {
          this.message = 'Something went wrong. Try again.'
          this.isError = true;
          return;
        }

      );
  }

}
