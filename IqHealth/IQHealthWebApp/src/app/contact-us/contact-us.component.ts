import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { APIResponse } from '../core/app.models';
import { AppService } from '../core/app.service';

declare var GMaps: any; 

@Component({
  selector: 'app-contact-us',
  templateUrl: './contact-us.component.html',
  styleUrls: ['./contact-us.component.scss']
})
export class ContactUsComponent implements OnInit {

sha: any;
isLoaded = false;
submitted = false;
status: string;
message: string;
enquiryForm: FormGroup;
showSpinner: boolean;

constructor(private readonly formBuilder: FormBuilder, private readonly appService: AppService) {}

  ngOnInit() {
    this.gMap();
    this.loadForm();
  }

  loadForm(): any {
    this.enquiryForm = this.formBuilder.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email, Validators.maxLength(150)]],
      mobile: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
      message: ['', [Validators.required, Validators.maxLength(1000)]],
      companyID: [2]
    });
  }

  reset(): void {
    this.submitted = false;
    this.enquiryForm.reset();
  }

  get f() { return this.enquiryForm.controls; }


  onSubmit(): any {
    this.submitted = true;
    if (this.enquiryForm.invalid) {
      return;
    }
    this.showSpinner = true;
    this.appService.submitContactUsForm(this.enquiryForm.value)
      .subscribe((res: APIResponse) => {
        this.showSpinner = false;
        if (res.isSuccess) {
          this.status = "Success";
          this.message = res.message;
          this.appService.sendEmailNotification('email-appointment', this.enquiryForm.value);
          this.reset();
          
        } else {
          this.status = "Fail";
          this.message = res.message;
          return;
        }
      })
  }

  gMap () {
    if ($('.google-map').length) {
        $('.google-map').each(function () {
            // getting options from html
            var Self = $(this); 
            var mapName = Self.attr('id');
            var mapLat = Self.data('map-lat');
            var mapLng = Self.data('map-lng');
            var iconPath = Self.data('icon-path');
            var mapZoom = Self.data('map-zoom');
            var mapTitle = Self.data('map-title');
            var markers = Self.data('markers');

            // defined default style
            // var styles = [{"featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{"color": "#444444"} ] }, {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"} ] }, {"featureType": "poi", "elementType": "all", "stylers": [{"visibility": "off"} ] }, {"featureType": "road", "elementType": "all", "stylers": [{"saturation": -100 }, {"lightness": 45 } ] }, {"featureType": "road.highway", "elementType": "all", "stylers": [{"visibility": "simplified"} ] }, {"featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{"visibility": "off"} ] }, {"featureType": "transit", "elementType": "all", "stylers": [{"visibility": "off"} ] }, {"featureType": "water", "elementType": "all", "stylers": [{"color": "#ededed"}, {"visibility": "on"} ] } ];

            // if zoom not defined the zoom value will be 15;
            if (!mapZoom) {
                const mapZoom = 15;
            };
            // init map
            var map;
            map = new GMaps({
                div: '#'+mapName,
                scrollwheel: false,
                lat: mapLat,
                lng: mapLng,
                // styles: styles,
                zoom: mapZoom
            });
            // if icon path setted then show marker
            if(iconPath) {
                $.each(markers, function (index, value) {
                    // var index = value;
                    var html;
                    if (index[2]) {
                        html = index[2];
                    };                    
                    if (!index[3]) {
                        index[3] = iconPath;
                    };
            
                    map.addMarker({
                        icon: index[3],                        
                        lat: index[0],
                        lng: index[1],
                        infoWindow: {
                          content: html
                        }
                    });   

                });
            }
        });  
    };
}

}
