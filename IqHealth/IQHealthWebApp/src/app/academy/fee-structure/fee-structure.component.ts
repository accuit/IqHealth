import { Component, OnInit } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';

@Component({
  selector: 'app-fee-structure',
  templateUrl: './fee-structure.component.html',
  styleUrls: ['./fee-structure.component.scss']
})
export class FeeStructureComponent implements OnInit {

  title: string = 'Fee Structure';
  url: string = 'home/academy';
  subtitle: string = 'Academy';
  parent: string = 'Fee Structure';
  sidebar: SideBarListModel;
  
  constructor() { }

  ngOnInit() {
  }

}
