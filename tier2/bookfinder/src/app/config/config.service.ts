import { Injectable, LOCALE_ID } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { BookInfo } from '../model/list.model';
import { Observable, of } from 'rxjs';
import { formatDate } from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {

  constructor(private http: HttpClient) { }

  infoList: BookInfo[] = [];
  findBookList(search?: string): Observable<BookInfo[]> {
    this.infoList = [];
    let params: HttpParams = undefined;
    if( search ) {
      params = new HttpParams().append('q', search);
    }

    this.http.get<BookInfo[]>(`https://www.googleapis.com/books/v1/volumes?`, {params})
    .subscribe(volume => {
      volume['items'].map(info => {
        console.log(info.volumeInfo);
        const date = info.volumeInfo.publishedDate !== undefined ? info.volumeInfo.publishedDate.split('-') : '';
        const publishedDate = date.length > 1 ? new Date(info.volumeInfo.publishedDate) : date[0];

        this.infoList.push({
          Title: info.volumeInfo.title,
          Author: info.volumeInfo.authors,
          Description: info.volumeInfo.description,
          imagePath: info.volumeInfo.imageLinks === undefined
          ? '../../assets/generic_book.jpg'
          : info.volumeInfo.imageLinks.thumbnail , // info.volumeInfo.imageLinks.thumbnail
          PublishedDate: publishedDate,
          FullDate: date.length > 1 ? true : false,
          // Link:
        });
      });
    });

    return of(this.infoList);
  }
}
