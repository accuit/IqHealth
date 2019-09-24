import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerReportsComponent } from './customer-reports.component';

describe('CustomerReportsComponent', () => {
  let component: CustomerReportsComponent;
  let fixture: ComponentFixture<CustomerReportsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CustomerReportsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomerReportsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
