import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-inner-banner',
  templateUrl: './inner-banner.component.html',
  styleUrls: ['./inner-banner.component.scss']
})
export class InnerBannerComponent implements OnInit {

  @Input('title') title: string;
  @Input('url') url: string;
  @Input('subtitle') subtitle: string;
  @Input('parent') parent: string;

  constructor() { }

  ngOnInit() {
    
  }

}
