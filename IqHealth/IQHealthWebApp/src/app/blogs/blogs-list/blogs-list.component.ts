import { Component, OnInit } from '@angular/core';
import { BlogService } from '../blog.service';
import { BlogMaster } from '../blog.model';

@Component({
  selector: 'app-blogs-list',
  templateUrl: './blogs-list.component.html',
  styleUrls: ['./blogs-list.component.scss']
})
export class BlogsListComponent implements OnInit {
  blogs: Array<BlogMaster>;
  tags: any;
  constructor(private readonly service: BlogService) { }

  ngOnInit() {
    this.service.getBlogs()
      .subscribe((res: any) => {
        this.blogs = res.singleResult;
        this.blogs.forEach(x => {
          this.tags = this.tags + ',' + x.tags;
        })
        this.tags = this.tags.split(',').filter(x=>x != 'undefined');
      })
  }

}
