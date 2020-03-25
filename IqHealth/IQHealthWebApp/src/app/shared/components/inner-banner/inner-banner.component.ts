import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-inner-banner',
  templateUrl: './inner-banner.component.html',
  styleUrls: ['./inner-banner.component.scss']
})
export class InnerBannerComponent implements OnInit {

  @Input('title') title: string;
  @Input('url') url = '/';
  @Input('subtitle') subtitle: string;
  @Input('parent') parent: string;
  @Input('caption') caption: string = '';
  @Input('banner-image') bannerImage? = '';
  @Input('show-title') showTitle: boolean = true;

  constructor() { }

  ngOnInit() {
    
  }

}
