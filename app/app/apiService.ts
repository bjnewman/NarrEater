import {Injectable} from '@angular/core';
import {Http, Headers, Response, RequestOptions} from '@angular/http';

@Injectable()
export class ApiService {

  constructor(private http:Http) { }

  parseText(rawImage: string) {
    let body = JSON.stringify({ rawImage });
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    var response = this.http.post('http://192.168.2.85:3000/menus', body, options)
    return response
  }
}
