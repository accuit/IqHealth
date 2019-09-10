import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SidebarBlogsComponent } from './sidebar-blogs.component';

describe('SidebarBlogsComponent', () => {
  let component: SidebarBlogsComponent;
  let fixture: ComponentFixture<SidebarBlogsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SidebarBlogsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SidebarBlogsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
