import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrganizeCampComponent } from './organize-camp.component';

describe('OrganizeCampComponent', () => {
  let component: OrganizeCampComponent;
  let fixture: ComponentFixture<OrganizeCampComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrganizeCampComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrganizeCampComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
