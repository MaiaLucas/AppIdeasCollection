import { Component } from '@angular/core';
import { ConfigService } from './config/config.service'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  constructor(private configService: ConfigService) { }

  title = 'Book Finder';
  placeholderSearch = "Search for your favorite book here"

  submit(value: string) {
    console.log(this.configService.getConfig())
    console.log(value)
  }
}
