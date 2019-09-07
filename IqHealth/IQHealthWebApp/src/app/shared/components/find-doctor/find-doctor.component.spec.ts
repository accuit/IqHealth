import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FindDoctorComponent } from './find-doctor.component';

describe('FindDoctorComponent', () => {
  let component: FindDoctorComponent;
  let fixture: ComponentFixture<FindDoctorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FindDoctorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FindDoctorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
