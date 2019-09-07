import { Component, OnInit, Input } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';

@Component({
  selector: 'app-sidebar-list',
  templateUrl: './sidebar-list.component.html',
  styleUrls: ['./sidebar-list.component.scss']
})
export class SidebarListComponent implements OnInit {

  @Input() list: SideBarListModel;

  constructor() { }

  ngOnInit() {

  }

}
