import { BrowserModule } from '@angular/platform-browser';
import { NgModule, LOCALE_ID  } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MatSliderModule } from '@angular/material/slider';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http'
import { ConfigService } from './config/config.service';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';
import { BooksListComponent } from './books-list/books-list.component';
import { SearchPageComponent } from './search-page/search-page.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [
    AppComponent,
    BooksListComponent,
    SearchPageComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatSliderModule,
    BrowserAnimationsModule,
    HttpClientModule,
    NgbModule,
    RouterModule.forRoot([
      { path: '', component: SearchPageComponent },
      { path: 'book', component: BooksListComponent },
    ])
  ],
  providers: [ConfigService],
  bootstrap: [AppComponent]
})
export class AppModule { }
