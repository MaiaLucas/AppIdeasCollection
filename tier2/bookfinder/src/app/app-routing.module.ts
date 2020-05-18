import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BooksListComponent } from './books-list/books-list.component';
import { AboutComponent } from './about/about.component';
import { SearchPageComponent } from './search-page/search-page.component';


const routes: Routes = [
  { path: 'book', component: BooksListComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
