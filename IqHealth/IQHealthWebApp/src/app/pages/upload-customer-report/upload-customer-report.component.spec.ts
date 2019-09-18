import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadCustomerReportComponent } from './upload-customer-report.component';

describe('UploadCustomerReportComponent', () => {
  let component: UploadCustomerReportComponent;
  let fixture: ComponentFixture<UploadCustomerReportComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UploadCustomerReportComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadCustomerReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
