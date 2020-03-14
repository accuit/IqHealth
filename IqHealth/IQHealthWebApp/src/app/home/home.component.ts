import { Component, OnInit } from '@angular/core';
import { AppService } from '../core/app.service';
import { APIResponse, Speciality, Doctor, ServicesModel } from '../core/app.models';
import { AppJsonService } from '../core/app.json.service';
import { Meta, Title } from '@angular/platform-browser';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  isLoaded: boolean = false;
  specialities: Speciality[] = [];
  doctors: Doctor[] = [];
  services: ServicesModel[] = [];
  data = {
    name: 'Health IQ | Improve yourself',
    bio: 'We care for you.',
    image: 'assets/images/logo.png'
  };

  constructor(private readonly service: AppService, private readonly jsonService: AppJsonService,
    private title: Title, private meta: Meta) {
      this.loadServicesList();
  }

  ngOnInit() {
    setTimeout(() => {
      this.seoData();
    }, 100);
    
  }

  seoData(){
    this.title.setTitle(this.data.name);
    this.meta.addTags([
      { name: 'twitter:card', content: 'summary' },
      { name: 'og:url', content: '/about' },
      { name: 'og:title', content: this.data.name },
      { name: 'og:description', content: this.data.bio },
      { name: 'og:image', content: this.data.image }
    ]);
  }

  seoData(){
    this.title.setTitle(this.data.name);
    this.meta.addTags([
      { name: 'twitter:card', content: 'summary' },
      { name: 'og:url', content: '/about' },
      { name: 'og:title', content: this.data.name },
      { name: 'og:description', content: this.data.bio },
      { name: 'og:image', content: this.data.image }
    ]);
  }

  loadSpecialities(): any {
    this.service.getSpecialities()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        
        this.specialities = data.SingleResult;
      })
  }

  loadDoctorsList(): any {
    this.service.getAllDoctors()
      .subscribe((data: APIResponse) => {
        this.isLoaded = true;
        this.doctors = data.SingleResult;
      })
  }

  loadServicesList(): any {
    this.services = this.jsonService.getAllServices();
    // this.service.getAllServices()
    // .subscribe((data: APIResponse) => {
    //   this.isLoaded = true;
    //   this.services = data.SingleResult;
    //   console.log(JSON.stringify(data.SingleResult));
    // })
  }

}
