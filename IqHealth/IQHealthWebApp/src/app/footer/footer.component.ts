import { Component, OnInit } from '@angular/core';
import { AppJsonService } from '../core/app.json.service';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {

  services: any;
  constructor(private readonly service: AppJsonService) { }

  ngOnInit() {
    this.services = this.service.getAllServices();
  }



}
