import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BooksListComponent } from './books-list/books-list.component';
import { AboutComponent } from './about/about.component';
import { SearchPageComponent } from './search-page/search-page.component';


const routes: Routes = [
  { path: 'about', component: AboutComponent },
  { path: 'books', component: BooksListComponent, data: { animation: 'isLeft' } },
  { path: 'search', component: SearchPageComponent, data: { animation: 'isRight' } },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
