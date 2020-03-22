import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CorporateTieUpComponent } from './corporate-tie-up.component';

describe('CorporateTieUpComponent', () => {
  let component: CorporateTieUpComponent;
  let fixture: ComponentFixture<CorporateTieUpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CorporateTieUpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CorporateTieUpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
