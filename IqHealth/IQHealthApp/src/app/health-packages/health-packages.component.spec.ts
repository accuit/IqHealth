import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HealthPackagesComponent } from './health-packages.component';

describe('HealthPackagesComponent', () => {
  let component: HealthPackagesComponent;
  let fixture: ComponentFixture<HealthPackagesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HealthPackagesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HealthPackagesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
