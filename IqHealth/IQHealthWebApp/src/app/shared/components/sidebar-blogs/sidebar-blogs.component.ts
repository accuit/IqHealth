import { Component, Input, Output, EventEmitter } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';

@Component({
  selector: 'app-sidebar-blogs',
  templateUrl: './sidebar-blogs.component.html',
  styleUrls: ['./sidebar-blogs.component.scss']
})
export class SidebarBlogsComponent {

  @Input() data: SideBarListModel;
  @Output() valueChange = new EventEmitter();


  change(id) {
    this.valueChange.emit(id);
  }

}
