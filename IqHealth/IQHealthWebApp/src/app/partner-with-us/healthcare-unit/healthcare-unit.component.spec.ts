import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HealthcareUnitComponent } from './healthcare-unit.component';

describe('HealthcareUnitComponent', () => {
  let component: HealthcareUnitComponent;
  let fixture: ComponentFixture<HealthcareUnitComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HealthcareUnitComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HealthcareUnitComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
