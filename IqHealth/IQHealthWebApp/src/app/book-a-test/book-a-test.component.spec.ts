import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BookATestComponent } from './book-a-test.component';

describe('BookATestComponent', () => {
  let component: BookATestComponent;
  let fixture: ComponentFixture<BookATestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BookATestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BookATestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
