import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/core/app.service';
import { APIResponse, ServicesModel } from 'src/app/core/app.models';
import { MetaTagService } from 'src/app/seo/meta-tags/meta-tag.service';

@Component({
  selector: 'app-services-list',
  templateUrl: './services-list.component.html',
  styleUrls: ['./services-list.component.scss']
})
export class ServicesListComponent implements OnInit {

  title: string = 'Our Services List';
  url:string = '#';
  subtitle: string = 'Our Services';
  parent: string = 'Home';
  isloaded: boolean;
  services: ServicesModel[];

  constructor(private readonly service: AppService, private readonly tags: MetaTagService) { }

  ngOnInit() {
    this.addMetaTags();
    this.loadServicesList();
  }

  addMetaTags(): void {
    this.tags.setTitle('Diagnostic care services | Health IQ');
    this.tags.setSocialMediaTags(
      'https://health-iq.in/services-list', 
      'Diagnostic care services | Health IQ',
      'Health IQ Provides best diagnostic services in Kolkata.',
      'corona-safety.png');
  }

  loadServicesList(): any {
    this.service.getAllServices()
      .subscribe((data: APIResponse) => {
        this.isloaded = true;
        this.services = data.SingleResult;
      })
  }

}
