import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MetaTagsComponent } from './meta-tags/meta-tags.component';
import { MetaTagService } from './meta-tags/meta-tag.service';

@NgModule({
  declarations: [MetaTagsComponent],
  imports: [
    CommonModule
  ],
  providers: [ MetaTagService]
})
export class SeoModule { }
