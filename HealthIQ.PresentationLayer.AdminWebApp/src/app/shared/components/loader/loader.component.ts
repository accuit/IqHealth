import { Component } from '@angular/core';
import { LoaderService } from '../../../../app/services/loader.service';
import { Subject } from 'rxjs';

@Component({
  selector: 'ipx-loader',
  templateUrl: './loader.component.html',
  styleUrls: ['./loader.component.css']
})
export class LoaderComponent {
  isLoading: Subject<boolean> = this.loaderService.isLoading;
  color = 'primary';
  mode = 'indeterminate';
  value = 50;

  constructor(private loaderService: LoaderService) {

    // this.loaderService.isLoading.subscribe((v) => {
    //   console.log(v);
    //   this.loading = v;
    // });

  }

}
