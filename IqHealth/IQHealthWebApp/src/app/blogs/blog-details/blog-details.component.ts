import { Component, OnInit } from '@angular/core';
import { BlogMaster } from '../blog.model';
import { BlogService } from '../blog.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-blog-details',
  templateUrl: './blog-details.component.html',
  styleUrls: ['./blog-details.component.scss']
})
export class BlogDetailsComponent {
  blogs: Array<BlogMaster>;
  blog: BlogMaster;
  tags: any;
  id: string;
  title: string = 'Blog title';
  subtitle: string = 'Blog subTitle';
  constructor(private readonly service: BlogService,
    private readonly route: ActivatedRoute) {
    this.route.paramMap.subscribe(params => {
      this.id = params.get("id");
      this.getBlogData();
    });
  }

  getBlogData() {
    this.service.getBlogs()
      .subscribe((res: any) => {
        this.blogs = res.singleResult;
        this.blog = this.blogs.filter(x => x.id === +this.id)[0];
        this.blogs.forEach(x => {
          this.tags = this.tags + ',' + x.tags;
        })
        this.tags = this.tags.split(',').filter(x => x != 'undefined');
        this.title = this.blog.title;
        this.subtitle = this.blog.subTitle;
      })
  }

}
