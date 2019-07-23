import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ArticlesEventComponent } from './articles-event.component';

describe('ArticlesEventComponent', () => {
  let component: ArticlesEventComponent;
  let fixture: ComponentFixture<ArticlesEventComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ArticlesEventComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ArticlesEventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
