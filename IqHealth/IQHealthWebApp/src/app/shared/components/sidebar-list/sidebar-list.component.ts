import { Component, OnInit, Input, AfterViewInit, Output, EventEmitter, ElementRef, Renderer2 } from '@angular/core';
import { SideBarListModel } from 'src/app/core/sidebar-list.model';

@Component({
  selector: 'app-sidebar-list',
  templateUrl: './sidebar-list.component.html',
  styleUrls: ['./sidebar-list.component.scss']
})
export class SidebarListComponent implements OnInit {

  @Input() list: SideBarListModel;
  @Output() valueChange = new EventEmitter();

  constructor(private readonly el: ElementRef,
    private readonly renderer: Renderer2) { }

  ngOnInit() {
    console.log(this.list);
  }


  change(id, event) {
    const element= this.el.nativeElement.querySelector('.active');
    console.log(event);
    this.renderer.removeClass(element, 'active');
    this.renderer.addClass(event.path[1], 'active');
    this.valueChange.emit(id);
  }

}
