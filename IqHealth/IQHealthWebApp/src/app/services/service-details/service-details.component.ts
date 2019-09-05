import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-service-details',
  templateUrl: './service-details.component.html',
  styleUrls: ['./service-details.component.scss']
})
export class ServiceDetailsComponent implements OnInit {
  title: string = 'Title';
  url:string = '#';
  subtitle: string = 'Subtitle';
  parent: string = 'Parent';

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    // this.route.paramMap.subscribe(params => {
    //   this.products.forEach((p: Product) => {
    //     if (p.id == params.id) {
    //       this.product = p;
    //     }
    //   });
    // });
  }

}
