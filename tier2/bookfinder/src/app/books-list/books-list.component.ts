import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { BookInfo } from '../model/list.model';
import { ConfigService } from '../config/config.service';

@Component({
  selector: 'app-books-list',
  templateUrl: './books-list.component.html',
  styleUrls: ['./books-list.component.scss']
})
export class BooksListComponent implements OnInit {

  constructor(private route: ActivatedRoute, private config: ConfigService, private router: Router) { }

  title       = 'Book Finder';
  searchValue = '';
  listBooks: BookInfo[];

  ngOnInit(): void {

    this.route.queryParams.subscribe(params => {
      this.searchValue = params.queryString;
    });

    this.config.findBookList(this.searchValue)
    .subscribe(info => {
      this.listBooks = info;
    });
  }

  showListOfBooks(searchValue = '') {
    const value = searchValue !== '' ? searchValue : this.searchValue;

    console.log(`search value - ${value}`);

    this.config.findBookList(value)
    .subscribe(info => {
      this.listBooks = info;
    });
  }

  back() {
    this.router.navigate(['/']);
  }
}
