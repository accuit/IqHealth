import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InnerBannerComponent } from './inner-banner.component';

describe('InnerBannerComponent', () => {
  let component: InnerBannerComponent;
  let fixture: ComponentFixture<InnerBannerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InnerBannerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InnerBannerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
