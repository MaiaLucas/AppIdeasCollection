import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class ConfigService {
  constructor(private http: HttpClient) { }
  configUrl = 'assets/config.json';

  getConfig() {
    console.log(this.http.get(this.configUrl))
    // return this.http.get(this.configUrl);
  }
}