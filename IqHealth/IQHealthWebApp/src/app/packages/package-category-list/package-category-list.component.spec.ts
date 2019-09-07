import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PackageCategoryListComponent } from './package-category-list.component';

describe('PackageCategoryListComponent', () => {
  let component: PackageCategoryListComponent;
  let fixture: ComponentFixture<PackageCategoryListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PackageCategoryListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PackageCategoryListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
