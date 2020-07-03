import { Component, OnInit } from '@angular/core';
import { AlertService } from 'src/app/services/alert.service';
import { BlogService } from '../blog.service';
import { BaseFormValidationComponent } from 'src/app/shared/components/base-form-validation/base-form-validation.component';
import { FormBuilder, Validators, FormControl, FormGroup, AbstractControl } from '@angular/forms';
import { BlogCategoryMappings } from '../blog.model';
import { APIResponse } from 'src/app/core/models';
import { AlertTypeEnum } from 'src/app/core/enums';

@Component({
  selector: 'app-create-blog',
  templateUrl: './create-blog.component.html',
  styleUrls: ['./create-blog.component.css']
})
export class CreateBlogComponent extends BaseFormValidationComponent implements OnInit {

  blogCategories = [{ categoryID: 1, title: 'Diagnostic' }, { categoryID: 2, title: 'Health And Fitness' }, { categoryID: 3, title: 'Diet' }];
  constructor(
    private readonly service: BlogService,
    private formBuilder: FormBuilder,
    private readonly alert: AlertService) {
    super()
  }
  ngOnInit(): void {
    this.createForm();
  }

  onSubmit(): any {
    this.isSubmitted = true;
    if (this.formGroup.invalid) {
      this.validateAllFormFields(this.formGroup);
      return;
    }
    this.inProgress = true;
    if (this.tags.value) {
      const tags = this.formGroup.value.tags.map(x => x.display).toString();
      this.formGroup.patchValue({ tags: tags });
    }
    this.service.addUpdateBlog(this.formGroup.value)
      .subscribe((res: APIResponse) => {
        if (res) {
          this.inProgress = false;
          this.alert.showAlert({ alertType: AlertTypeEnum.success, text: res.message });
        }
        this.inProgress = false;
      },
      () => {
        this.inProgress = false;
      });
  }

  get tags(): AbstractControl {
    return this.formGroup.get('tags');
  }

  onFileChange(event, control: string) {
    this.file = null;
    if (event.target.files &&
      event.target.files.length > 0) {
      // Don't allow file sizes over 1MB
      if (event.target.files[0].size < this.MAX_FILE_SIZE) {
        this.file = event.target.files[0];

        this.getimageBase64String(this.file, control);

      }
      else {  // Display error message
        this.errMessage.push("File: " +
          event.target.files[0].name
          + " is too large to upload.");
      }
    }
  }

  createForm() {
    this.formGroup = this.formBuilder.group({
      id: [''],
      name: ['', [Validators.required]],
      title: ['', [Validators.required]],
      subTitle: [''],
      postDate: ['', [Validators.required]],
      bannerImage: [''],
      thumbImage: [''],
      sequence: [''],
      content: [''],
      tags: [[{ display: 'healthiq', value: 'healthiq' }]],
      isLive: [true, [Validators.required]],
      isDeleted: [false],
      companyID: [''],
      blogCategoryMappings: ['']
    });
  }

}
