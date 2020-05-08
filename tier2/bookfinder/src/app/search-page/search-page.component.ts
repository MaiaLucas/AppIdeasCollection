import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ConfigService } from '../config/config.service';
import { BookInfo } from '../model/list.model';

@Component({
  selector: 'app-search-page',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.scss']
})
export class SearchPageComponent implements OnInit {

  constructor(private http: HttpClient, private config: ConfigService) { }
  title             = 'Book Finder';
  placeholderSearch = 'Search for your favorite book here';
  showList          = false;
  listBooks: BookInfo[];
  
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }


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
    this.showList = true;
  }

}
