import { Component, OnInit, Output } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ConfigService } from '../config/config.service';
import { BookInfo } from '../model/list.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-search-page',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.scss']
})
export class SearchPageComponent implements OnInit {

  constructor(private http: HttpClient, private config: ConfigService, private router: Router) { }
  placeholderSearch = 'Search for your favorite book here';
  show              = false;
  listBooks: BookInfo[];

  ngOnInit(): void { }

  submit(value: string) {

    if (value === '') {
      alert('Please search for available book');
      return;
    }
    this.listBooks = [];
    this.config.findBookList(value)
    .subscribe(info => {
      this.listBooks = info;
    });
    this.show = true;
  }


}
