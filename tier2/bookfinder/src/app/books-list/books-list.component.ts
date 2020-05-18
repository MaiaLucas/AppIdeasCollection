import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BookInfo } from '../model/list.model';

@Component({
  selector: 'app-books-list',
  templateUrl: './books-list.component.html',
  styleUrls: ['./books-list.component.scss']
})
export class BooksListComponent implements OnInit {

  constructor(private route: ActivatedRoute) { }

  title: string = '';
  listBooks: BookInfo[];
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.title = params['title'];
      this.listBooks = params['list']
    });
  }

}
