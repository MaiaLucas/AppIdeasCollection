import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ConfigService } from './config/config.service';
import { BookInfo } from './model/list.model';
import { Observable } from 'rxjs';
import { async } from '@angular/core/testing';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  constructor(private http: HttpClient, private config: ConfigService) { }

  title             = 'Book Finder';
  placeholderSearch = 'Search for your favorite book here';
  showList          = false;
  listBooks: BookInfo[];

  submit(value: string) {
    if(value === '') {
      alert('Please search for available book');
      return
    }
    this.listBooks = [];
    this.config.findBookList(value)
    .subscribe(info => {
      this.listBooks = info;
    });
    this.showList = true;
  }
}
