import { Component, OnInit, Input } from "@angular/core";
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { AccountService } from "src/app/academy/account/account.service";
import { AppJsonService } from "src/app/core/app.json.service";
import { APIResponse, UserMaster } from "src/app/core/app.models";
import { HttpResponse, HttpEventType } from "@angular/common/http";
import { PagesService } from "../pages.service";
import { UserTypeEnum } from '../shared/model/enums';

@Component({
  selector: "app-upload-customer-report",
  templateUrl: "./upload-customer-report.component.html",
  styleUrls: ["./upload-customer-report.component.scss"]
})
export class UploadCustomerReportComponent implements OnInit {
  uploadForm: FormGroup;
  submitted = false;
  selectedCustomerID: any;
  selectedCustomerText = 'Select Customer';
  customers: UserMaster[] = [];
  isLoaded = false;
  files: any;
  isUploading = false;
  message: string = 'Processing...';

  percentDone: number;
  uploadSuccess: boolean;

  @Input("userID") userID: string;
  @Input("userType") userType: string;
  isError: boolean;

  constructor(
    private formBuilder: FormBuilder,
    private readonly accountService: AccountService,
    private readonly pageService: PagesService
  ) { }

  ngOnInit() {
    this.getCustomers();
    this.uploadForm = this.loadForm();
  }

  get f() {
    return this.uploadForm.controls;
  }

  loadForm(): any {
    return this.formBuilder.group({
      customerID: ["", Validators.required],
      comments: [""],
      fileName: ["", Validators.required],
      companyID: [2, Validators.required]
    });
  }

  upload(files: File[]) {
    //pick from one of the 4 styles of file uploads below
    this.files = files;
  }

  uploadAndProgress() {
    if (this.files[0].type !== 'application/pdf') {
      this.isError = true;
      this.message = 'Please upload pdf report only.';
      return;
    }
    this.isUploading = true;
    this.pageService.uploadCustomerReport(this.files, this.selectedCustomerID, this.userID)
      .subscribe(event => {
        if (event.type === HttpEventType.UploadProgress) {
          this.percentDone = Math.round((100 * event.loaded) / event.total);
        } else if (event instanceof HttpResponse) {
          if (event.body.IsSuccess) {
            this.uploadSuccess = true;
            this.uploadForm.reset();
            this.message = 'Report successfully uploaded.';
          } else {
            this.message = event.body.Message;
            this.isError = true;
            return;
          }
        }
        this.isUploading = false;
        this.isError = false;
      });
  }

  selectCustomer(c) {
    this.selectedCustomerID = c.ID;
    this.selectedCustomerText = c.FirstName;
    this.uploadForm.controls["customerID"].setValue(c.ID);
  }

  getCustomers() {
    this.accountService.getUsersByType(UserTypeEnum.Customer).subscribe((res: APIResponse) => {
      if (res.IsSuccess) {
        this.customers = res.SingleResult;
        this.isLoaded = true;
      }
    });
  }

  onSubmit(): any {
    this.submitted = true;
    if (this.uploadForm.invalid) {
      console.log(this.uploadForm);
      return;
    }
    this.accountService
      .registerUser(this.uploadForm.value)
      .subscribe((res: APIResponse) => {
        alert(res.Message);
      });
  }
}
