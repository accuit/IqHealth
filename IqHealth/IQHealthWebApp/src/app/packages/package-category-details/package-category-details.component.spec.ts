import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PackageCategoryDetailsComponent } from './package-category-details.component';

describe('PackageCategoryDetailsComponent', () => {
  let component: PackageCategoryDetailsComponent;
  let fixture: ComponentFixture<PackageCategoryDetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PackageCategoryDetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PackageCategoryDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
