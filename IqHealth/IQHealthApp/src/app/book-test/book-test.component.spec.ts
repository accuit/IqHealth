import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BookTestComponent } from './book-test.component';

describe('BookTestComponent', () => {
  let component: BookTestComponent;
  let fixture: ComponentFixture<BookTestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BookTestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BookTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
