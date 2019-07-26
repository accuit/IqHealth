import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DoctorConsultationComponent } from './doctor-consultation.component';

describe('DoctorConsultationComponent', () => {
  let component: DoctorConsultationComponent;
  let fixture: ComponentFixture<DoctorConsultationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DoctorConsultationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DoctorConsultationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
